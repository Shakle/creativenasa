import 'package:flutter/material.dart';

class AppTheme {

  static Color primaryColor = ColorScheme.fromSeed(seedColor: Colors.red).primary;

  static ThemeData get lightMainTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorSchemeSeed: Colors.red, // Mars is red :D
      appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryColor,
        contentTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}