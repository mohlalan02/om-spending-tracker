import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth/data/auth_repository.dart';
import '../models/transaction_item.dart';
import 'data/transaction_repository.dart';

class SpendingHomeScreen extends StatelessWidget {
  const SpendingHomeScreen({super.key});

  final AuthRepository authRepository = const AuthRepository();
  final TransactionRepository repository = const TransactionRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spending Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authRepository.logout();

              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
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
              child: FutureBuilder<List<TransactionItem>>(
                future: repository.getTransactions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  final transactions = snapshot.data ?? [];

                  return ListView.builder(
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