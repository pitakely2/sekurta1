import 'package:sekurta/models/user_model.dart';

class UserModel {
  final String uid;
  final String email;
  final String password;

  UserModel({required this.uid, required this.email, required this.password});

  // Factory constructor to create a UserModel from Firebase User
  factory UserModel.fromFirebaseUser(Users user) {
    return UserModel(
      uid: user.id,
      email: user.email!,
      password: user.password,
    );
  }
}