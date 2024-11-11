import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Color(0xFFDCCCE8),
    foregroundColor: Colors.black54
  ),
  primaryColor: const Color(0xFFF7EFFE),
  focusColor: const Color(0xFF674FA3),
  highlightColor: Colors.black54,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white
    )






  // Define additional light theme properties here
);
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Color(0xFF707070),
    foregroundColor: Colors.white70
  ),
  primaryColor: const Color(0xFF7C8280),
    focusColor: const Color(0xFFD7E8E2),
  highlightColor: Colors.white70,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(0.8)
),
  // Define additional dark theme properties here
);