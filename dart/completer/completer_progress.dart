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

  void complete() {
    steps.add(maxValue);
  }

  bool get hasCompleted => fraction == 1.0;

  double get fraction {
    double sum = steps.fold(0.0, (x, y) => x + y);
    if (sum > maxValue) sum = maxValue.toDouble();
    return sum / maxValue;
  }
}
