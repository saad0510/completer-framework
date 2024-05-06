abstract class RecoveryStrategy {
  const RecoveryStrategy();

  Future<bool> recover(Future<bool> Function() action);
}
