import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/auth_event.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/init.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/events/log_in.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/auth_state.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_in.dart';
import 'package:habit_tracker_flutter/blocs/auth_bloc/states/user_logged_out.dart';
import 'package:habit_tracker_flutter/firebase/auth_service.dart';

import 'events/log_out.dart';

class AuthBlock extends Bloc<AuthEvent, AuthState> {
  AuthBlock(AuthState initialState) : super(initialState);

  final _auth = AuthService();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Init) {
      final user = await _auth.getActiveUser();
      yield user == null ? UserLoggedOut() : UserLoggedIn();
    } else if (event is LogIn) {
      final user = await _auth.signInAnon();
      yield user == null ? UserLoggedOut() : UserLoggedIn();
    } else if (event is LogOut) {
      yield UserLoggedOut();
    } else {
      throw Exception('Unknown event');
    }
  }
}
