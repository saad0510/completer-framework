class CompleterProgress {
  final num maxValue;
  final List<num> steps;

  CompleterProgress({
    this.maxValue = 100,
  })  : steps = [],
        assert(maxValue >= 0);

  void addStep(num step) {
    steps.add(step);
  }

  void markAsCompleted() {
    steps.add(maxValue);
  }

  bool get hasCompleted => asFraction == 1.0;

  double get asFraction {
    double sum = steps.fold(0.0, (x, y) => x + y);
    if (sum > maxValue) sum = maxValue.toDouble();
    return sum / maxValue;
  }
}
