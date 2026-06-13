import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/transaction_repository.dart';

class SpendingHomeScreen extends StatelessWidget {
  const SpendingHomeScreen({super.key});

  final TransactionRepository repository = const TransactionRepository();

  @override
  Widget build(BuildContext context) {
    final transactions = repository.getTransactions();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/login');
          },
        ),
        title: const Text('Spending Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const [
                    Text(
                      'Available Balance',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'R 35,231',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
      ),

      const SizedBox(height: 16),

      Expanded(
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];

            return Card(
              child: ListTile(
               title: Text(transaction.merchant),
               subtitle: Text(transaction.category),
               trailing: Text(transaction.amount),
              ),
            );
          },
        ),
      ),
    ],
  ),
),
    );
  }
}