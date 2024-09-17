import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String displayName;
  final String email;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uid: user.uid,
      displayName: user.displayName ?? 'No name',
      email: user.email ?? 'No email',
    );
  }
}
