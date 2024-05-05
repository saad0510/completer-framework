import 'event.dart';
import 'event_listener.dart';

class EventNotifier<T> {
  final List<EventListener<T>> listeners;

  EventNotifier() : listeners = [];

  void attach(EventListener<T> listener) {
    listeners.add(listener);
  }

  void detach(EventListener<T> listener) {
    listeners.remove(listener);
  }

  void notify(T state) {
    final event = Event(
      data: state,
      createdAt: DateTime.now(),
    );

    for (final listener in listeners) {
      listener.listen(event);
    }
  }
}
