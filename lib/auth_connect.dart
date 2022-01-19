import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  // firebase state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
  // methods
  Future<dynamic> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Sign In";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<dynamic> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
