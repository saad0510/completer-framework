class Event<T> {
  final T data;
  final DateTime createdAt;

  const Event({
    required this.data,
    required this.createdAt,
  });
}
