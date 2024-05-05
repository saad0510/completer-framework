import '../completer/completer.dart';
import '../failures/failure.dart';
import 'states.dart';

class CompleterRecoveringsState extends CompleterState {
  const CompleterRecoveringsState();

  @override
  void recover(Completer completer) async {
    final strategy = completer.recoveryStrategy!;
    final isRecovered = await strategy.recover(() => recoverAction(completer));
    isRecovered ? recovered(completer) : fail(completer);
  }

  void recovered(Completer completer) {
    completer.setState(const CompleterRecoveredState());
    completer.runTask();
  }

  @override
  void fail(Completer completer, [Failure? failure]) {
    completer.setState(const CompleterAbortedState());
  }

  bool recoverAction(Completer completer) {
    try {
      completer.task();
      return true;
    } catch (e) {
      return false;
    }
  }
}
