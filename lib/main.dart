import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/habit_bloc.dart';
import 'package:habit_tracker_flutter/screens/habit_editor_page.dart';
import 'package:habit_tracker_flutter/screens/home_page.dart';
import 'package:habit_tracker_flutter/screens/settings_page.dart';
import 'package:habit_tracker_flutter/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HabitBlock([]),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: Themes.getThemeFromKey(ThemeKeys.light),
        darkTheme: Themes.getThemeFromKey(ThemeKeys.dark),
        themeMode: ThemeMode.dark,
        routes: {
          '/': (context) => HomePage(),
          '/habit_editor': (context) => HabitEditorPage(),
          '/settings': (context) => SettingsPage()
        },
      ),
    );
  }
}
