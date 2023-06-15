// import 'dart:math';
// import 'package:animations_in_flutter/chart/bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// // https://medium.com/flutter/zero-to-one-with-flutter-43b13fd7b354
// // https://medium.com/flutter/zero-to-one-with-flutter-part-two-5aa2f06655cb 

// class ChartApp extends StatelessWidget {
//   const ChartApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: ChartPage());
//   }
// }

// class ChartPage extends StatefulWidget {
//   const ChartPage({super.key});

//   @override
//   State<ChartPage> createState() => _ChartPageState();
// }

// class _ChartPageState extends State<ChartPage>
//     with SingleTickerProviderStateMixin {
//   final random = Random();

//   int dataSet = 50;

//   late AnimationController animation;

//   late BarTween tween;

//   void initState() {
//     super.initState();
//     animation = AnimationController(
//         duration: const Duration(milliseconds: 300), vsync: this);
//     tween = BarTween(Bar(0.0), Bar(50.0));
//     animation.forward();
//   }

//   @override
//   void dispose() {
//     animation.dispose();
//     super.dispose();
//   }

//   void changeData() {
//     setState(() {
//       dataSet = random.nextInt(100);
//       tween = BarTween(tween.evaluate(animation), Bar(random.nextDouble() * 100.0));
//     });
//     animation.forward(from: 0.0);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//             // CustomPaint is a widget that delegates painting to a CustomPainter strategy
//             child: CustomPaint(
//                 size: Size(200.0, 100.0),
//                 painter: BarChartPainter(animation: tween.animate(animation)))),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.refresh),
//           onPressed: changeData,
//         )
//     );
//   }
// }