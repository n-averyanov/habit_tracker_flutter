import 'package:habit_tracker_flutter/blocs/auth_bloc/events/auth_event.dart';

class SignIn extends AuthEvent {
  final email;
  final password;

  SignIn(this.email, this.password);
}
