import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/auth_event.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/init.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/sign_in.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/sign_up.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/auth_state.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/loading_state.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_in.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_out.dart';
import 'package:habit_tracker_flutter/firebase/auth_service.dart';

import 'events/log_out.dart';

class AuthBlock extends Bloc<AuthEvent, AuthState> {
  AuthBlock(AuthState initialState) : super(initialState);

  final _auth = AuthService();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield LoadingState();
    if (event is Init) {
      final user = await _auth.getActiveUser();
      yield user == null ? UserLoggedOut() : UserLoggedIn(user);
    } else if (event is SignIn) {
      final user = await _auth.signIn(event.email, event.password);
      yield user == null ? UserLoggedOut() : UserLoggedIn(user);
    } else if (event is LogOut) {
      await _auth.signOut();
      yield UserLoggedOut();
    } else if (event is SignUp) {
      final user = await _auth.signUp(event.email, event.password);
      yield user == null ? UserLoggedOut() : UserLoggedIn(user);
    } else {
      throw Exception('Unknown event');
    }
  }
}
