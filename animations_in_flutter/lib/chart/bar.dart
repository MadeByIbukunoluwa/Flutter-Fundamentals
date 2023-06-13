import 'dart:ui' show lerpDouble;
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class Bar {
  Bar(this.height);

  final double? height;

  static Bar lerp(Bar? begin, Bar? end, double t) {
    return Bar(lerpDouble(begin?.height, end?.height, t));
  }
}

class BarTween extends Tween<Bar> {
  BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

  @override
  Bar lerp(double t) => Bar.lerp(begin, end, t);
}

class BarChartPainter extends CustomPainter {
  static const barWidth = 10.0;

  BarChartPainter({required Animation<Bar> animation})
      : animation = animation,
        super(repaint: animation);

  final Animation<Bar> animation;

  // final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final bar = animation.value;
    final paint = Paint()
      ..color = Colors.blue[400] as Color
      ..style = PaintingStyle.fill;

    canvas.drawRect(
        Rect.fromLTWH(
          (size.width - barWidth) / 2.0,
          size.height - (bar.height as double) ,
          barWidth,
          bar.height as double, 
        ),
        paint);
  }

  @override
  bool shouldRepaint(BarChartPainter old) => false;
}


// the subtraction of two doubles in dart returns an int 