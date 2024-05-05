import '../completer/completer.dart';
import 'completer_resumed_state.dart';
import 'completer_state.dart';

class CompleterPausedState extends CompleterState {
  const CompleterPausedState();

  @override
  void resume(Completer completer) {
    completer.setState(const CompleterResumedState());
    completer.runTask();
  }
}
