import '../models/transaction_item.dart';

class TransactionRepository {
  const TransactionRepository();

  List<TransactionItem> getTransactions() {
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