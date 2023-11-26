import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme _colorScheme = ColorScheme.dark(
  primary: Color.fromARGB(255, 128, 128, 128),
  background: Color(0xff252525),
  onBackground: Color(0xff3B3B3B),
);

final themeData = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  scaffoldBackgroundColor: _colorScheme.background,
  colorScheme: _colorScheme,
  textTheme: TextTheme(
    titleLarge: GoogleFonts.nunito(
      fontSize: 43,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: GoogleFonts.nunito(
      fontSize: 23,
      fontWeight: FontWeight.w400,
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
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 10,
    backgroundColor: _colorScheme.background,
    foregroundColor: Colors.white,
    sizeConstraints: const BoxConstraints(
      minHeight: 70,
      maxHeight: 70,
      minWidth: 70,
      maxWidth: 70,
    ),
    shape: const CircleBorder(),
  ),
  dialogTheme: DialogTheme(
    contentTextStyle: GoogleFonts.nunito(
      fontSize: 15,
      fontWeight: FontWeight.w400,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  searchViewTheme: SearchViewThemeData(
    backgroundColor: _colorScheme.background,
    headerHintStyle: GoogleFonts.nunito(
      fontSize: 20,
      fontWeight: FontWeight.w300,
      color: const Color(0xFFCCCCCC),
    ),
  ),
);
