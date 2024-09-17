import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show TickerProvider;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Physics-based Animation Example'),
        ),
        body: Center(
          child: SpringAnimationDemo(),
        ),
      ),
    );
  }
}

class SpringAnimationDemo extends StatefulWidget {
  @override
  _SpringAnimationDemoState createState() => _SpringAnimationDemoState();
}

class _SpringAnimationDemoState extends State<SpringAnimationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _animation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: Transform.translate(
            offset: Offset(0, _animation.value),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
