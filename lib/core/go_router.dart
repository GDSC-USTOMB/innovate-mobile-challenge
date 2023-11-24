import 'package:go_router/go_router.dart';
import 'package:noteapp/screens/new_note_screen.dart';

import '../screens/home_screen.dart';

GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/HomeScreen',
    ),
    GoRoute(
      path: '/HomeScreen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/NewNote',
      builder: (context, state) => const NewNoteScreen(),
    ),
  ],
);
