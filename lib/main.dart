import 'package:flutter/material.dart';

void main() {
  runApp(const OmSpendingTrackerApp());
}

class OmSpendingTrackerApp extends StatelessWidget {
  const OmSpendingTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OM Spending Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_balance, size: 72),
              const SizedBox(height: 16),
              const Text(
                'OM Spending Tracker',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text('Track your spending safely'),
              const SizedBox(height: 32),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SpendingHomeScreen(),
                      ),
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpendingHomeScreen extends StatelessWidget {
  const SpendingHomeScreen({super.key});

  final List<Map<String, String>> transactions = const [
    {'merchant': 'Checkers', 'amount': '-R450', 'category': 'Groceries'},
    {'merchant': 'Uber', 'amount': '-R120', 'category': 'Transport'},
    {'merchant': 'Netflix', 'amount': '-R199', 'category': 'Subscriptions'},
    {'merchant': 'Salary', 'amount': '+R35,000', 'category': 'Income'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spending Tracker'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];

          return Card(
            child: ListTile(
              title: Text(transaction['merchant']!),
              subtitle: Text(transaction['category']!),
              trailing: Text(
                transaction['amount']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}