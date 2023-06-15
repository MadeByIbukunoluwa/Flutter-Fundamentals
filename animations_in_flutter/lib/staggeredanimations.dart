

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';


class StaggerDemoApp extends StatelessWidget {
  const StaggerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StaggerDemo(),
    );
  }
}



class StaggerAnimation extends StatelessWidget {
  const StaggerAnimation({super.key, required this.controller});


  opacity = Tween<double>(
    begin: 0.0,
    end: 1.0 
  ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.0, 0.100,curve: Curves.ease)
      )
  ),

  width = Tween<double>(
    begin: 50.0,
    end: 150.0
  ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(
          0.0, 0.100,
        curve: Curves.ease)
      )
  ),

  height = Tween<double>(
    begin: 50.0,
    end: 150.0
  ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.250, 0.375,curve: Curves.ease)
      )
  ),

  padding = EdgeInsetsTween(
    begin:const EdgeInsets.only(bottom: 16) ,
    end:const EdgeInsets.only(bottom: 75) 
  ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.250, 0.375,curve: Curves.ease)
      )
  ),

  borderRadius = BorderRadiusTween(
    begin: BorderRadius.circular(4),
    end:BorderRadius.circular(75)
  ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.375, 0.500,curve: Curves.ease)
      )
  ),

  color = ColorTween(
    begin: Colors.indigo[100],
    end: Colors.orange[400]
  ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: const Interval(0.500, 0.750,curve: Curves.ease)
      )
  );

  
  final Animation<double> controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius?> borderRadius;
  final Animation<Color?> color;

  Widget _buildAnimation(BuildContext context,Widget? child) {
    return Container(
        padding: padding.value,
        alignment: Alignment.bottomCenter,
        child: Opacity(
          opacity: opacity.value,
            child: Container(
              width: width.value,
              height: height.value,
              decoration: BoxDecoration(
                color:color.value,
                border:Border.all(
                  color: Colors.indigo[300]!,
                  width:3,
                ),
                borderRadius: borderRadius.value
              ),
            ),
        ),
    );
}


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller, 
      builder:_buildAnimation)
  }

}


class StaggerDemo extends StatefulWidget {
  const StaggerDemo({super.key});

  @override
  State<StaggerDemo> createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with SingleTickerProviderStateMixin {

late AnimationController _controller;

void initState () {
  super.initState();

  _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
}

 void dispose() {
  _controller.dispose();
  super.dispose();
 }

Future<void> _playAnimation() async {
  try{
    await _controller.forward().orCancel;
    await _controller.reverse().orCancel;
  } on TickerCanceled {

  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staggered Animation')
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color:Colors.black.withOpacity(0.5)
              )
            ),
            child: StaggerAnimation(controller: _controller.view,),
          ),
        ),
      ),
    );
  }
}