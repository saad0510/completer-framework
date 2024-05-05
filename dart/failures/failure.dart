class Failure<T> {
  final String message;
  final T? object;
  final String? stackTrace;

  const Failure({
    required this.message,
    this.object,
    this.stackTrace,
  });
}
