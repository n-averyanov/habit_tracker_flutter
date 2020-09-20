import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/log_out.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/auth_state.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_in.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/events/clear.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/habit_bloc.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBlock>(context);
    final habitBloc = BlocProvider.of<HabitBlock>(context);

    final state = authBloc.state;
    if (state is UserLoggedIn) {
      return Card(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Current user:'),
            SizedBox(
              height: 8,
            ),
            Text('${state.user.email}'),
            SizedBox(
              height: 8,
            ),
            Center(
              child: RaisedButton(
                onPressed: () {
                  authBloc.add(LogOut());
                  habitBloc.add(Clear());
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                child: Text('Log out'),
              ),
            )
          ],
        ),
      ));
    } else
      return Text('error');
  }
}
