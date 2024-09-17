import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import services for orientation
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:module3/restrict-landscape/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Restrict to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}