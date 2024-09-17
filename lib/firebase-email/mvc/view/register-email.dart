import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-email/mvc/controller/email-auth-conroller.dart';
import 'package:module3/firebase-email/mvc/view/home-email.dart';

class RegistrationScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: "Phone"),
            ),
            TextField(
              controller: dobController,
              decoration: InputDecoration(labelText: "Date of Birth"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await authController.signUp(
                  emailController.text,
                  passwordController.text,
                  nameController.text,
                  phoneController.text,
                  dobController.text,
                );
                Get.off(() => HomeScreen());
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
