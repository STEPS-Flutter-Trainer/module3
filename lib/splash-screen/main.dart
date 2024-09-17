import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module3/splash-screen/splash-screen.dart';
import 'home-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/home', page: () => HomeScreen()), // Define your HomeScreen
      ],
      builder: (context, child) {
        // Initialize ScreenUtil
        ScreenUtil.init(context, designSize: Size(360, 690), minTextAdapt: true);
        return child!;
      },
    );
  }
}
