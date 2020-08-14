import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/log_in.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final block = BlocProvider.of<AuthBlock>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(onPressed: () {
          block.add(LogIn());
        }),
      ),
    );
  }
}
