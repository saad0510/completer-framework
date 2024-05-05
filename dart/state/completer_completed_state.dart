import 'completer_exited_state.dart';

class CompleterCompletedState<T> extends CompleterExitedState {
  final T data;

  const CompleterCompletedState({
    required this.data,
  });
}
