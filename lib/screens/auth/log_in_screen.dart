import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/sign_in.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/sign_up.dart';

class LogInScreen extends StatefulWidget {
  final String error;

  LogInScreen({this.error});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String error;

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
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      return value.isEmpty ? 'Enter an email' : null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      return value.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                block.add(SignUp(_emailController.text.trim(),
                                    _passwordController.text.trim()));
                              }
                            },
                            child: Text('Sign Up'),
                          ),
                          SizedBox(width: 24),
                          RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                block.add(SignIn(_emailController.text.trim(),
                                    _passwordController.text.trim()));
                              }
                            },
                            child: Text('Sign In'),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: widget.error != null,
                        child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(widget.error ?? "")),
                            color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
