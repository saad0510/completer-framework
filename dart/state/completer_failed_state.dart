import '../completer/completer.dart';
import '../failures/failure.dart';
import 'completer_aborted_state.dart';
import 'completer_recovering_state.dart';
import 'completer_state.dart';

class CompleterFailedState extends CompleterState {
  final Failure? error;

  const CompleterFailedState({
    required this.error,
  });

  bool get haError => error != null;

  @override
  void abort(Completer completer) {
    completer.setState(const CompleterAbortedState());
  }

  @override
  void recover(Completer completer) async {
    completer.setState(const CompleterRecoveringsState());
    completer.state.recover(completer);
  }
}
