import 'package:firebase_auth/firebase_auth.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/auth_state.dart';

class UserLoggedIn extends AuthState {
  final FirebaseUser user;

  UserLoggedIn(this.user);
}
