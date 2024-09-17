import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-email/mvc/controller/email-auth-conroller.dart';
import 'package:module3/firebase-email/mvc/view/profile-email.dart';
import 'package:module3/firebase-email/mvc/view/sign-in-email.dart';


class HomeScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Get.to(() => ProfileScreen());
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authController.signOut();
              Get.off(() => SignInScreen());
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
