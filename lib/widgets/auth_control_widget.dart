import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/auth_bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/auth_state.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/loading_state.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_in.dart';
import 'package:habit_tracker_flutter/screens/auth/log_in_screen.dart';
import 'package:habit_tracker_flutter/screens/habit/home_page.dart';

class AuthControlWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBlock, AuthState>(
      builder: (context, state) {
        if (state is UserLoggedIn) {
          return HomePage();
        } else if (state is LoadingState) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else {
          return LogInScreen();
        }
      },
    );
  }
}
