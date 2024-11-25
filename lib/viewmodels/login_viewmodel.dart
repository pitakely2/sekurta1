import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sekurta/models/user_model.dart';


class LoginViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  String? _errorMessage;

  User? get user => _user;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      _user = userCredential.user;
      _errorMessage = null;
    } catch (e) {
      _user = null;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}

mixin FirebaseAuth {
  signInWithEmailAndPassword({required String email, required String password}) {}
}

mixin UserCredential {
  User? get user => null;
}


