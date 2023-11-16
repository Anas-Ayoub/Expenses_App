import 'package:flutter/material.dart';

bool isDarkMode = false;
var mode = ThemeMode.light;
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  // Add other properties for the light theme.
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.indigo,
  // Add other properties for the dark theme.
);


