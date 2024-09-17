import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-email/mvc/controller/email-auth-conroller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController dobController = TextEditingController();

    // Initialize the controllers with user data if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authController.userModel.value != null) {
        nameController.text = authController.userModel.value!.displayName ?? '';
        phoneController.text = authController.userModel.value!.phoneNumber ?? '';
        dobController.text = authController.userModel.value!.dateOfBirth ?? '';
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle profile update
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
