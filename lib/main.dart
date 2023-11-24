import 'package:flutter/material.dart';

import 'core/go_router.dart';
import 'theme.dart';

void main() {
  runApp(
    MaterialApp.router(
      title: 'Notes',
      theme: themeData,
      routerConfig: appRouter,
    ),
  );
}
