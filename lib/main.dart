import 'package:flutter/material.dart';
import 'app/router.dart';
import 'features/auth/login_screen.dart';

void main() {
  runApp(const OmSpendingTrackerApp());
}

class OmSpendingTrackerApp extends StatelessWidget {
  const OmSpendingTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OM Spending Tracker',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}