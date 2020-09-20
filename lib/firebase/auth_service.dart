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

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    var result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  Future<FirebaseUser> signUp(String email, String password) async {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user;
  }
}
