import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/log_out.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_in.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/events/clear.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/habit_bloc.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  ThemeMode theme = ThemeMode.dark;
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBlock>(context);
    final habitBloc = BlocProvider.of<HabitBlock>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Theme'),
                DropdownButton(
                    value: theme,
                    items: ThemeMode.values
                        .map<DropdownMenuItem<ThemeMode>>((ThemeMode theme) {
                      return DropdownMenuItem<ThemeMode>(
                        value: theme,
                        child: Text(describeEnum(theme)),
                      );
                    }).toList(),
                    onChanged: (ThemeMode newTheme) {
                      setState(() {
                        isChanged = true;
                        theme = newTheme;
                      });
                    }),
                Builder(builder: (BuildContext context) {
                  final state = authBloc.state;
                  if (state is UserLoggedIn) {
                    return RaisedButton(onPressed: () {
                      authBloc.add(LogOut());
                      habitBloc.add(Clear());
                      Navigator.of(context).pop();
                    });
                  } else {
                    return Text('Error');
                  }
                })
              ],
            ),
            Builder(
              builder: (BuildContext context) {
                return Center(
                    child: Visibility(
                        visible: isChanged,
                        child: RaisedButton(
                          onPressed: () {
                            final snackBar = SnackBar(
                                content: Text('Not implemented yet :('));
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                          child: Text('Save'),
                        )));
              },
            )
          ],
        ),
      ),
    );
  }
}
