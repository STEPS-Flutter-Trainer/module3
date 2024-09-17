import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../model/user-model.dart';
import '../view/signin.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Rx<UserModel?> userModel = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        userModel.value = UserModel.fromFirebaseUser(user);
      } else {
        userModel.value = null;
      }
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (e) {
      print("Error signing in with Google: $e");
    }
  }

  Future<void> signOut() async {
    await  FirebaseAuth.instance.signOut();
   await GoogleSignIn().signOut();
    Get.off(() => SignInScreen()); // Navigate to SignInScreen


  }
}
