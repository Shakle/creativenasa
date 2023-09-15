import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData get lightMainTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      colorSchemeSeed: Colors.red, // Mars is red :D
    );
  }
}