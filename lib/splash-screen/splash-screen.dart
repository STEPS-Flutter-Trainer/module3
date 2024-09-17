import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil
    ScreenUtil.init(context, designSize: Size(360, 690),
        minTextAdapt: true);

    // Navigate to the next screen after a delay
    Future.delayed(Duration(seconds: 5), () {
      Get.offAllNamed('/home'); // Replace '/home' with your desired route
    });

    return Scaffold(
      body: Center(
        child: Image.asset('asset/applogo.png')
        ),

    );
  }
}
