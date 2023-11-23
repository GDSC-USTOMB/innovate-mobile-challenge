import 'package:flutter/material.dart';
import 'package:noteapp/theme.dart';

import 'screens/home_screen.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: themeData,
      home: const HomeScreen(),
    );
  }
}
