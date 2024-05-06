import 'dart:async';

import '../completer/completer_facade.dart';
import '../events/event_listener.dart';
import '../failures/retry_recovery_strategy.dart';
import '../state/states.dart';

Future<void> sleep(int seconds) {
  return Future.delayed(Duration(seconds: seconds));
}

class PeriodicCounter extends CompleterFacade<int> {
  PeriodicCounter() : super(0);

  @override
  Future<void> task() async {
    while (state is CompleterExecutingState) {
      if (value == 7) throw TimeoutException('Value of 7 is not allowed');
      if (value == 10) return complete(999);

      setValue(value + 1);
      progress.addStep(value);

      print('$value: ${progress.asFraction}');
      await sleep(1);
    }
  }

  @override
  void onCompleted(data) {
    print('completed: ${data}, progress ${progress.asFraction}');
  }
}

void main() async {
  final completer = PeriodicCounter()
    ..recoveryStrategy = RetryRecoveryStrategy(
      maxRetries: 3,
      delayInMilliseconds: 1000,
    );

  EventListener(
    completer,
    (event) {
      if (event.data is CompleterExitedState) print('ending completer');
    },
  );

  completer.execute();
  await sleep(2);

  completer.pause();
  await sleep(1);

  completer.resume();
}
