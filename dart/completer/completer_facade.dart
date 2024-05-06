import '../failures/failure.dart';
import '../state/states.dart';
import 'completer.dart';

abstract class CompleterFacade<T> extends Completer {
  T value;

  CompleterFacade(this.value);

  void setValue(T newValue) {
    value = newValue;
  }

  void execute() => state.execute(this);
  void pause() => state.pause(this);
  void resume() => state.resume(this);
  void abort() => state.abort(this);
  void complete(T data) => state.complete<T>(this, data);
  void fail(Failure error) => state.fail(this, error);

  void onPaused() {}
  void onResumed() {}
  void onExited() {}
  void onError(Failure? failure) {}
  void onCompleted(T data) {}

  @override
  void notify(state) {
    super.notify(state);
    print('notify: ${state.runtimeType}');

    if (state is CompleterPausedState) onPaused();
    if (state is CompleterResumedState) onResumed();
    if (state is CompleterExitedState) onExited();
    if (state is CompleterFailedState) onError(state.error);
    if (state is CompleterCompletedState) onCompleted(state.data);
  }
}
