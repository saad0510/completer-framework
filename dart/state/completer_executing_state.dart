import '../completer/completer.dart';
import '../failures/failure.dart';
import 'completer_aborted_state.dart';
import 'completer_completed_state.dart';
import 'completer_failed_state.dart';
import 'completer_paused_state.dart';
import 'completer_state.dart';

class CompleterExecutingState extends CompleterState {
  const CompleterExecutingState();

  @override
  void pause(Completer completer) {
    completer.setState(const CompleterPausedState());
  }

  @override
  void complete<T>(Completer completer, T data) {
    completer.progress.markAsCompleted();
    completer.setState(CompleterCompletedState(data: data));
  }

  @override
  void abort(Completer completer) {
    completer.setState(const CompleterAbortedState());
  }

  @override
  void fail(Completer completer, [Failure? error]) {
    completer.setState(CompleterFailedState(error: error));
  }
}
