import 'event.dart';
import 'event_notifier.dart';

class EventListener<T> {
  final EventNotifier<T> notifier;
  final void Function(Event<T> event) listen;

  EventListener(this.notifier, this.listen) {
    notifier.attach(this);
  }
}
