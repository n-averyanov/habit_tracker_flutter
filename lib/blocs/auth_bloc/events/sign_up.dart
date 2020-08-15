import 'package:habit_tracker_flutter/blocs/auth_bloc/events/auth_event.dart';

class SignUp extends AuthEvent {
  final String email;
  final String password;

  SignUp(this.email, this.password);
}
