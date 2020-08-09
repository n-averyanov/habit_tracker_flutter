import 'package:flutter/material.dart';

enum ThemeKeys { light, dark }

class Themes {
  static final _lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity);

  static final _darkTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    accentColor: Colors.blueGrey[300],
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(ThemeKeys themeKey) {
    switch (themeKey) {
      case ThemeKeys.light:
        return _lightTheme;
      case ThemeKeys.dark:
        return _darkTheme;
      default:
        return _lightTheme;
    }
  }
}
