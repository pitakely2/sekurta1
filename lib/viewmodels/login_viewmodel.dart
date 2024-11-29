import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sekurta/models/user_model.dart';

import 'login_viewmodel.dart';


class LoginViewModel extends ChangeNotifier {
  User? _user;
  String? _errorMessage;

  User get user => _user;
  String? get errorMessage => _errorMessage;

  Future<void> login(Users user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      _user = userCredential.user;
      _errorMessage = null;
    } catch (e) {
      _user = null;
      _errorMessage = e.toString();
    }
    notifyListeners();
  }
}



