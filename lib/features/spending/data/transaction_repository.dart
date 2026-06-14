import '../../models/transaction_item.dart';
import 'local_transaction_storage.dart';

class TransactionRepository {
  final LocalTransactionStorage localStorage;

  const TransactionRepository({
    this.localStorage = const LocalTransactionStorage(),
  });

  Future<List<TransactionItem>> getTransactions() async {
    final localTransactions = localStorage.getTransactions();

    if (localTransactions.isNotEmpty) {
      return localTransactions
          .map(
            (transaction) => TransactionItem.fromJson(
              transaction as Map<dynamic, dynamic>,
            ),
          )
          .toList();
    }

    final seedTransactions = _seedTransactions();

    await localStorage.saveTransactions(
      seedTransactions.map((transaction) => transaction.toJson()).toList(),
    );

    return seedTransactions;
  }

  List<TransactionItem> _seedTransactions() {
    return const [
      TransactionItem(
        merchant: 'Checkers',
        amount: '-R450',
        category: 'Groceries',
      ),
      TransactionItem(
        merchant: 'Uber',
        amount: '-R120',
        category: 'Transport',
      ),
      TransactionItem(
        merchant: 'Netflix',
        amount: '-R199',
        category: 'Subscriptions',
      ),
      TransactionItem(
        merchant: 'Salary',
        amount: '+R35,000',
        category: 'Income',
      ),
    ];
  }
}