import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('transactionsBox');

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