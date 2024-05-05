import '../completer/completer.dart';
import 'completer_executing_state.dart';
import 'completer_state.dart';

class CompleterCreatedState extends CompleterState {
  const CompleterCreatedState();

  @override
  void execute(Completer completer) {
    completer.setState(const CompleterExecutingState());
    completer.runTask();
  }
}
