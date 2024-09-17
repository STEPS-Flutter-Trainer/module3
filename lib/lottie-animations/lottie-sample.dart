import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LottieSample(),
    );
  }
}
class LottieSample extends StatefulWidget {
  const LottieSample({super.key});

  @override
  State<LottieSample> createState() => _LottieSampleState();
}

class _LottieSampleState extends State<LottieSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset("asset/file1.json"),
    );
  }
}
