import 'package:go_router/go_router.dart';

import '../features/auth/login_screen.dart';
import '../features/spending/spending_home_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/spending',
      builder: (context, state) => const SpendingHomeScreen(),
    ),
  ],
);