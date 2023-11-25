import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:noteapp/core/di_container.dart';

import 'core/go_router.dart';
import 'theme.dart';

void main() {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Color(0xff252525)),
  );

  runApp(
    MaterialApp.router(
      title: 'Notes',
      theme: themeData,
      routerConfig: appRouter,
    ),
  );
}
