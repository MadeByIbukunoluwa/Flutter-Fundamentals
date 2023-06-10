import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';



// https://medium.com/flutter/zero-to-one-with-flutter-43b13fd7b354

class ChartApp extends StatelessWidget {
  const ChartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ChartPage());
  }
}

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  final random = Random();

  int dataSet = 50;

  void changeData() {
    setState(() {
      dataSet = random.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // CustomPaint is a widget that delegates painting to a CustomPainter strategy 
        child: CustomPaint(
          size:Size(200.0,100.0),
          painter:BarChartPainter()
        )
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: changeData,
      ),
    );
  }
}


class BarChartPainter extends CustomPainter {

  static const barWidth = 10.0;


  const BarChartPainter({required this.barHeight}) ;

  final double barHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
        ..color = Colors.blue[400] as Color
        ..style = PaintingStyle.fill;

   canvas.drawRect(
        Rect.fromLTWH(
          (size.width - barWidth) / 2.0,
          size.height - barHeight,
          barWidth, 
          barHeight),
        paint
    );
  }

  @override
  bool shouldRepaint(BarChartPainter old) => barHeight != old.barHeight;
}