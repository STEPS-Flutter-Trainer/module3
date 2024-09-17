import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home-screen.dart';
import '../controller/auth-controller.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await authController.signInWithGoogle();
            Get.off(() => HomeScreen()); // Navigate to HomeScreen
          },
          child: Text("Sign in with Google"),
        ),
      ),
    );
  }
}
