import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile-screen.dart';
import '../../signin-screen.dart';
import '../controller/auth-controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

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
              Get.off(() => SignInScreen()); // Navigate to SignInScreen
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
