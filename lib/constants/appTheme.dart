import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'Raleway',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFFE7E7EB),
      ),
      displayMedium: TextStyle(
        color: Color(0xFFE7E7EB),
        fontWeight: FontWeight.w900,
      ),
      displaySmall: TextStyle(
        color: Color(0xFFA09FB1),
      ),
      headlineLarge: TextStyle(
        color: Color(0xFFA09FB1),
      ),
      headlineSmall: TextStyle(
        color: Color(0xFFE7E7EB),
        fontWeight: FontWeight.w900,
      ),
      titleLarge: TextStyle(
        color: Color(0xFFE7E7EB),
      ),
      titleMedium: TextStyle(
        color: Color(0xFFE7E7EB),
      ),
      titleSmall: TextStyle(
        color: Color(0xFFA09FB1),
      ),
      labelLarge: TextStyle(
        color: Color(0xFFE7E7EB),
      ),
    ),
  );
}
