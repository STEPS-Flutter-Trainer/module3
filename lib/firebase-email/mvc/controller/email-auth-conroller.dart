import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-email/mvc/model/user-model-email.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User?> _firebaseUser = Rx<User?>(null);
  Rx<UserModel?> userModel = Rx<UserModel?>(null); // Define userModel

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      _firebaseUser.value = user;
      if (user != null) {
        _fetchUserProfile(user.uid);
      } else {
        userModel.value = null;
      }
    });
  }

  Future<void> _fetchUserProfile(String uid) async {
    // Fetch user profile from Firestore or Realtime Database
    try {
      var userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (userDoc.exists) {
        userModel.value = UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error fetching user profile: $e");
    }
  }

  Future<void> signUp(String email, String password, String name, String phone, String dob) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        // Save additional user data to Firestore
        UserModel newUserModel = UserModel(
          uid: user.uid,
          email: email,
          displayName: name,
          phoneNumber: phone,
          dateOfBirth: dob,
        );
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set(newUserModel.toMap());
      }
    } catch (e) {
      print("Error signing up: $e");
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print("Error signing in: $e");
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> updateProfile(String name, String phone, String dob) async {
    // Update user profile data in Firestore
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        UserModel updatedUserModel = UserModel(
          uid: user.uid,
          email: user.email,
          displayName: name,
          phoneNumber: phone,
          dateOfBirth: dob,
        );
        await FirebaseFirestore.instance.collection('users').doc(user.uid).update(updatedUserModel.toMap());
        userModel.value = updatedUserModel;
      }
    } catch (e) {
      print("Error updating profile: $e");
    }
  }
}
