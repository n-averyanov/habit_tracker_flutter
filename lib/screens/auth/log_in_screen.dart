import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/sign_in.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/sign_up.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final block = BlocProvider.of<AuthBlock>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to HabitTracker!',
              style: TextStyle(fontSize: 24),
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          block.add(SignUp(_emailController.text.trim(),
                              _passwordController.text.trim()));
                        },
                        child: Text('Sign Up'),
                      ),
                      SizedBox(width: 24),
                      RaisedButton(
                        onPressed: () {
                          block.add(SignIn(_emailController.text.trim(),
                              _passwordController.text.trim()));
                        },
                        child: Text('Sign In'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
