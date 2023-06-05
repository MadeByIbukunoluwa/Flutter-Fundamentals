// We will build an animation from first principles with TickerController and setState

// https://medium.com/flutter/animation-deep-dive-39d3ffea111f

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class MyAnimatedApp extends StatelessWidget {
  const MyAnimatedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // body: MyAnimatedWidget(),
        body:MyPragmaticWidget()
      ),
    );
  }
}

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({super.key});

  @override
  State<MyAnimatedWidget> createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int i = 0;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(_update);
    _controller.forward();
  }

  void _update() {
    // the code assigns a value from zero to the speed of light depending on the animation's progress
    setState(() {
      i = (_controller.value * 299792458).round();
    });
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$i m/s'));
  }
}

// implementation with a built in widget

class MyPragmaticWidget extends StatelessWidget {
  const MyPragmaticWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: IntTween(begin: 0, end: 299792458),
        duration: Duration(seconds: 1),
        builder: (BuildContext context, int i, Widget? child) {
            return Center(
              child:Text('$i m/s')
            );
        }
      );
  }
}

// lets add a controller that can reverse it repeat it ,
