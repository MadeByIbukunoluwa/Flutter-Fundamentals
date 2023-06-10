//https://docs.flutter.dev/ui/animations/tutorial

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    // the add listener function calls setState so that everytime the Animation generates a new number, the current frame is marked as dirty which forces build to be called again .
    // animation = Tween<double>(begin: 0, end: 300).animate(controller)
    //   ..addListener(() {
    //     setState(() {

    //     });
    //   });
    animation = CurvedAnimation(parent: controller, curve:Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..addStatusListener((status) => print('$status'));
    controller.forward();
  }
  // using set state
  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: Container(
  //         margin: const EdgeInsets.symmetric(),
  //         height: animation.value,
  //         width: animation.value,
  //         child: const FlutterLogo()),
  //   );
  // }
  // AnimatedWidget
  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  // Widget build(BuildContext context) {
  //   return GrowTransition(
  //     animation: animation,
  //     child: const LogoWidget(),
  //   );
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//we can use the AnimatedWidget helper class (instead of addListener() and setState()) to create a widget that animates

//Use animatedWidget to create a widget that performs a reuable animation . To separate the transition from the widget, use an animatedBuilder

//Examples of AnimatedWidgets in the Flutter API: AnimatedBuilder, AnimatedModalBarrier, DecoratedBoxTransition, FadeTransition, PositionedTransition, RelativePositionedTransition, RotationTransition, ScaleTransition, SizeTransition, SlideTransition.

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);

  static final _sizeTween = Tween<double>(begin: 0, end: 300);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
        child: Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo()
        ),
    ));
  }
}

// animated builder version
// An AnimatedBuilder understands how to render the transition
// it doesn't know how to render the widget, nor does it manage the Animation objct
// use animatedBuilder to describe an animation as part of a build method for another widget ,If you simply want to define a widget with a reusable animation, use an AnimatedWidget,
// examples of animatedBuilders in the Flutter API
// An animatedBuilder is a separate class in the render tree. Like AnimatedWidget, AnimatedBuilder automatically listens to notifications from the Animation Object and marks the widget tree dirty as necessary , so you don't need to call addListener()

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({required this.child, required this.animation, super.key});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
