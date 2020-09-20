import 'package:habit_tracker_flutter/blocs/auth_bloc/states/auth_state.dart';

class LoginError extends AuthState {
  final String error;
  LoginError(this.error);
}
