import '../completer/completer.dart';
import '../failures/failure.dart';

abstract class CompleterState {
  const CompleterState();

  void execute(Completer completer) {
    throw UnimplementedError();
  }

  void pause(Completer completer) {
    throw UnimplementedError();
  }

  void resume(Completer completer) {
    throw UnimplementedError();
  }

  void complete<T>(Completer completer, T data) {
    throw UnimplementedError();
  }

  void abort(Completer completer) {
    throw UnimplementedError();
  }

  void fail(Completer completer, [Failure? error]) {
    throw UnimplementedError();
  }

  void recover(Completer completer) {
    throw UnimplementedError();
  }
}
