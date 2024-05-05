abstract class RecoveryStrategy {
  const RecoveryStrategy();

  Future<bool> recover(bool Function() action);
}
