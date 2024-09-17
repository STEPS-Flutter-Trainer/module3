import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-email/mvc/controller/email-auth-conroller.dart';
import 'package:module3/firebase-email/mvc/view/home-email.dart';

class SignInScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authController.signIn(
                  emailController.text,
                  passwordController.text,
                );
                Get.off(() => HomeScreen());
              },
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }
}
