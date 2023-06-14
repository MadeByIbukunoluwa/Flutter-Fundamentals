

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class StaggerAnimation extends StatelessWidget {
  const StaggerAnimation({super.key, required this.controller}) 

  @override
  Widget build(BuildContext context) {
    return const ;
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
            child: StaggerAnimation(controller: _controller.view,),
          ),
        ),
      ),
    );
  }
}