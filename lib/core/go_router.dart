import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: '/HomeScreen',
  routes: [
    GoRoute(
      path: '/HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
