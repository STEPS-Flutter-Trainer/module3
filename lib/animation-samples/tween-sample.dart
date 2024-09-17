import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tween Animation Example'),
        ),
        body: Center(
          child: TweenAnimationDemo(),
        ),
      ),
    );
  }
}

class TweenAnimationDemo extends StatefulWidget {
  @override
  _TweenAnimationDemoState createState() => _TweenAnimationDemoState();
}

class _TweenAnimationDemoState extends State<TweenAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: ColorTween(begin: Colors.blue, end: Colors.red),
      duration: Duration(seconds: 10),
      builder: (context, Color? color, child) {
        return Container(
          width: 100,
          height: 100,
          color: color,
        );
      },
    );
  }
}
