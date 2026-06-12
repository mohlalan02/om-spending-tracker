import 'package:flutter/material.dart';
import 'features/auth/login_screen.dart';

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
      home: const LoginScreen(),
    );
  }
}