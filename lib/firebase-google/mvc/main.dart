import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module3/firebase-google/mvc/view/home.dart';
import 'package:module3/firebase-google/mvc/view/signin.dart';
import '../../firebase_options.dart';
import 'controller/auth-controller.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize AuthController
  Get.put(AuthController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Firebase App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Obx(() {
      if (authController.userModel.value == null) {
        // User is not logged in, show SignInScreen
        return SignInScreen();
      } else {
        // User is logged in, show HomeScreen
        return HomeScreen();
      }
    });
  }
}
