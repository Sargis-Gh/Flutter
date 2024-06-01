import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primaryContainer: Color.fromRGBO(200, 197, 197, 1),
    onPrimaryContainer: Color.fromRGBO(255, 255, 255, 1),
    surface: Color.fromRGBO(245, 244, 241, 1),
    primary: Color.fromRGBO(89, 100, 119, 1),
    tertiary: Colors.black,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromRGBO(10, 18, 30, 1),
    primary: Color.fromRGBO(55, 67, 87, 1),
    primaryContainer: Color.fromRGBO(11, 20, 34, 1),
    onPrimaryContainer: Color.fromRGBO(21, 40, 65, 1),
    tertiary: Colors.white,
  ),
);
