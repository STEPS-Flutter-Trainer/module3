import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-google/mvc/view/signin.dart';

import '../controller/auth-controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await authController.signOut();
              Get.off(() => SignInScreen()); // Navigate back to SignInScreen
            },
          ),
        ],
      ),
      body: Obx(() {
        final userModel = authController.userModel.value;

        if (userModel == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "User Profile",
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: 20),
              Text(
                "UID: ${userModel.uid}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Name: ${userModel.displayName}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Email: ${userModel.email}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                 authController.signOut();
                 Get.off(() => SignInScreen()); // Navigate to SignInScreen

                },
                child: Text("Edit Profile"),
              ),
            ],
          ),
        );
      }),
    );
  }
}
