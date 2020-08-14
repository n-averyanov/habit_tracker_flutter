import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getActiveUser() async {
    return await _auth.currentUser();
  }

  Future<FirebaseUser> signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();
      return result.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
