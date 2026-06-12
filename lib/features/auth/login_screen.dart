import 'package:flutter/material.dart';
import '../spending/spending_home_screen.dart';

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
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

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
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
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