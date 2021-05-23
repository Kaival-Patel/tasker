import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasker/exception/authException.dart';

class FireAuth {
  FirebaseAuth mAuth = FirebaseAuth.instance;
  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await mAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      print("Error signing in:$err");
      AuthException(errorCode: err.code).handleEmailPasswordSignIn();
      return null;
    }
  }
}
