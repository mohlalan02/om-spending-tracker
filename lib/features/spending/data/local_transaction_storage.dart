import 'package:hive_flutter/hive_flutter.dart';

class LocalTransactionStorage {
  const LocalTransactionStorage();

  static const String boxName = 'transactionsBox';

  Box get _box => Hive.box(boxName);

  Future<void> saveTransactions(
    List<Map<String, dynamic>> transactions,
  ) async {
    await _box.put(
      'transactions',
      transactions,
    );
  }

  List<dynamic> getTransactions() {
    return _box.get(
      'transactions',
      defaultValue: [],
    );
  }
}