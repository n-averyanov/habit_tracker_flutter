import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/init_state.dart';
import 'package:habit_tracker_flutter/screens/auth/register_screen.dart';
import 'package:habit_tracker_flutter/screens/habit/habit_editor_page.dart';
import 'package:habit_tracker_flutter/screens/settings_page.dart';
import 'package:habit_tracker_flutter/themes.dart';
import 'package:habit_tracker_flutter/widgets/auth_control_widget.dart';

import 'blocs/auth_bloc/events/init.dart';
import 'blocs/habit_bloc/events/get_habits.dart';
import 'blocs/habit_bloc/habit_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Themes.getThemeMode(),
        builder: (BuildContext context, AsyncSnapshot<ThemeMode> snapshot) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => HabitBlock([])..add(GetHabits())),
              BlocProvider(
                create: (_) => AuthBlock(InitState())..add(Init()),
              )
            ],
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: Themes.getThemeFromKey(ThemeKeys.light),
              darkTheme: Themes.getThemeFromKey(ThemeKeys.dark),
              themeMode: snapshot.data,
              routes: {
                '/': (context) => AuthControlWidget(),
                '/habit_editor': (context) => HabitEditorPage(),
                '/settings': (context) => SettingsPage(),
                '/signUp': (context) => RegisterScreen()
              },
            ),
          );
        });

    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => HabitBlock([])..add(GetHabits())),
    //     BlocProvider(
    //       create: (_) => AuthBlock(InitState())..add(Init()),
    //     )
    //   ],
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: Themes.getThemeFromKey(ThemeKeys.light),
    //     darkTheme: Themes.getThemeFromKey(ThemeKeys.dark),
    //     themeMode: ThemeMode.dark,
    //     routes: {
    //       '/': (context) => AuthControlWidget(),
    //       '/habit_editor': (context) => HabitEditorPage(),
    //       '/settings': (context) => SettingsPage(),
    //       '/signUp': (context) => RegisterScreen()
    //     },
    //   ),
    // );
  }
}
