import 'package:firebase_auth/firebase_auth.dart';
import 'package:sekurta/models/login_model.dart';
import 'package:sekurta/models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Get current user as UserModel
  UserModel? get currentUser {
    final user = _firebaseAuth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user as Users) : null;
  }

  // Sign in and return UserModel
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(userCredential.user! as Users);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "An unknown error occurred";
    }
  }

  // Sign up and return UserModel
  Future<UserModel?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return UserModel.fromFirebaseUser(userCredential.user! as Users);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "An unknown error occurred";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw e.toString();
    }
  }
}
