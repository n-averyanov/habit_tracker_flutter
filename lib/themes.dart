import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  static const THEME_MODE = 'themeMode';

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    var themeMode = prefs.getInt(THEME_MODE);

    if (themeMode == null) {
      themeMode = ThemeMode.system.index;
      prefs.setInt('theme', themeMode);
    }

    return ThemeMode.values[themeMode];
  }

  static Future<void> writeThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt(THEME_MODE, themeMode.index);
  }
}
