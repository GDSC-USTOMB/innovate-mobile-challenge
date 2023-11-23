import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final themeData = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xff252525),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.nunito(
      fontSize: 43,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w300,
    ),
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 24,
    backgroundColor: Color(0x00000000),
  ),
);
