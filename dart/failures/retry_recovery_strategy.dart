import 'recovery_strategy.dart';

class RetryRecoveryStrategy extends RecoveryStrategy {
  final int maxRetries;
  final int delayInMilliseconds;

  const RetryRecoveryStrategy({
    required this.maxRetries,
    required this.delayInMilliseconds,
  });

  @override
  Future<bool> recover(bool Function() action) async {
    for (int i = 0; i < maxRetries; i++) {
      await Future.delayed(Duration(milliseconds: delayInMilliseconds));
      final success = action();
      if (success) return true;
    }
    return false;
  }
}
