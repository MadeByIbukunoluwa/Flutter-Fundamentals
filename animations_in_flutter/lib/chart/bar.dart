// import 'dart:ui' show lerpDouble;
// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'color_palette.dart';

// class BarChart {
//   static const barCount = 5;

//   BarChart(List<Bar> bars) {
//     assert(bars.length == barCount);
//   }
//   factory BarChart.empty() {
//     return BarChart(List.filled(barCount, Bar(0.0, Colors.transparent)));
//   }
//   factory BarChart.random(Random random) {
//     final Color? color = ColorPalette.primary.random(random);
//     return BarChart(
//         List.generate(barCount, (i) => Bar(random.nextDouble() * 100, color)));
//   }

//   final List<Bar> bars;

//   static BarChart lerp(BarChart begin, BarChart end, double t) {
//     return BarChart(List.generate(
//         barCount, (i) => Bar.lerp(begin.bars[i], end.bars[i], t)));
//   }
// }

// class BarChartTween extends Tween<BarChart> {
//   BarChartTween(BarChart begin, BarChart end) : super(begin: begin, end: end);

//   @override
//   BarChart lerp(double t) => BarChart.lerp(begin, end, t);
// }

// class Bar {
//   Bar(this.height, this.color);

//   final double? height;
//   final Color? color;

//   static Bar lerp(Bar? begin, Bar? end, double t) {
//     // If we did it individually such there is no Bar class that takes in differnet lerps, we would have two tweens - one for the height and one for the color
//     return Bar(lerpDouble(begin?.height, end?.height, t),
//         Color.lerp(begin?.color, end?.color, t));
//   }
// }

// class BarTween extends Tween<Bar> {
//   BarTween(Bar begin, Bar end) : super(begin: begin, end: end);

//   @override
//   Bar lerp(double t) => Bar.lerp(begin, end, t);
// }

// class BarChartPainter extends CustomPainter {
//   static const barWidth = 10.0;

//   BarChartPainter({required Animation<Bar> animation})
//       : animation = animation,
//         super(repaint: animation);

//   final Animation<Bar> animation;

//   // final double barHeight;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final bar = animation.value;
//     final paint = Paint()
//       ..color = Colors.blue[400] as Color
//       ..style = PaintingStyle.fill;

//     canvas.drawRect(
//         Rect.fromLTWH(
//           (size.width - barWidth) / 2.0,
//           size.height - (bar.height as double),
//           barWidth,
//           bar.height as double,
//         ),
//         paint);
//   }

//   @override
//   bool shouldRepaint(BarChartPainter old) => false;
// }

// // the subtraction of two doubles in dart returns an int
