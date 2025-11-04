import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:utslab5pemob/Screen/home_screen.dart';
import 'package:utslab5pemob/Screen/profile_screen.dart';
import 'package:utslab5pemob/Screen/quiz_screen.dart';

import '../Widgets/custom_shell.dart';

class AppRoutes {
  static const String home = '/home';
  static const String profile = '/profile';
  static const String quiz = '/quiz';
}

GoRouter createRouter() {
  final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.quiz,
        name: 'sign-in',
        builder: (context, state) => const QuizScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) {
          return CustomShell(child: child);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              '404 - Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text('Path: ${state.uri.path}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}