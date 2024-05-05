import '../failures/failure.dart';
import '../events/event_notifier.dart';
import '../failures/recovery_strategy.dart';
import '../state/states.dart';
import 'completer_progress.dart';

abstract class Completer extends EventNotifier<CompleterState> {
  RecoveryStrategy? recoveryStrategy;
  CompleterState state = const CompleterCreatedState();
  CompleterProgress progress = CompleterProgress();

  void setState(CompleterState completerState) {
    state = completerState;
    notify(completerState);
  }

  Future<void> task();

  void runTask() async {
    try {
      await task();
    } catch (e, s) {
      final error = Failure(
        object: e,
        message: e.toString(),
        stackTrace: s.toString(),
      );
      state.fail(this, error);
      if (recoveryStrategy != null)
        state.recover(this);
      else
        state.abort(this);
    }
  }
}
