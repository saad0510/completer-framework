import 'recovery_strategy.dart';

class FallbackRecoveryStrategy extends RecoveryStrategy {
  final void Function() fallback;

  const FallbackRecoveryStrategy({
    required this.fallback,
  });

  @override
  Future<bool> recover(bool Function() action) async {
    fallback();
    return false;
  }
}
