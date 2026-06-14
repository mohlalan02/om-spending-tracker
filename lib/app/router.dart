import 'package:go_router/go_router.dart';

import '../features/auth/data/auth_repository.dart';
import '../features/auth/login_screen.dart';
import '../features/spending/spending_home_screen.dart';

final AuthRepository authRepository = const AuthRepository();

final GoRouter router = GoRouter(
  initialLocation: '/login',
  redirect: (context, state) async {
    final bool loggedIn = await authRepository.isLoggedIn();

    final bool isOnLoginPage = state.matchedLocation == '/login';

    if (!loggedIn && !isOnLoginPage) {
      return '/login';
    }

    if (loggedIn && isOnLoginPage) {
      return '/spending';
    }

    return null;
  },
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