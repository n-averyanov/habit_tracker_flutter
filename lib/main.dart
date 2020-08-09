import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/screens/home_page.dart';
import 'package:habit_tracker_flutter/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      theme: Themes.getThemeFromKey(ThemeKeys.light),
      darkTheme: Themes.getThemeFromKey(ThemeKeys.dark),
      themeMode: ThemeMode.dark,
    );
  }
}
