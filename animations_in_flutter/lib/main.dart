import 'package:flutter/material.dart';
import 'package:animations_in_flutter/dynamicallymodifytweenvalues.dart';
import 'package:animations_in_flutter/implicitanimations.dart';
import 'package:animations_in_flutter/tweenanimationbuilder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

// https://medium.com/flutter/custom-implicit-animations-in-flutter-with-tweenanimationbuilder-c76540b47185
// https://medium.com/flutter/directional-animations-with-built-in-explicit-animations-3e7c5e6fbbd7
// https://github.com/afitz0/spinning_time/blob/master/lib/main.dart

//variables declared as static final variables are done so that they would not be rebuitlt everytime
void main() {
  runApp(MyApp());
}

const double smallIconSize = 24.0;
const double largeIconSize = 196.0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Scaffold(
            body: Container(
                color: Colors.black,
                child: Center(child: _TimeMachine()
                    // MyWidget()
                    // ColorAnimationWithStaticFinal();
                    //OngoingAnimationByModifyingEndTweenValue();
                    ))),
        debugShowCheckedModeBanner: false);
  }
}

//Directional animations with built in explicit animations

class _TimeMachine extends StatefulWidget {
  const _TimeMachine({super.key});

  @override
  State<_TimeMachine> createState() => _TimeMachineState();
}

class _TimeMachineState extends State<_TimeMachine>
    with SingleTickerProviderStateMixin {
  // late final AnimationController _animationController;
  late final AnimationController _repeatingAnimationShort;
  late final AnimationController _repeatingAnimationLong;
  late final AnimationController _loopingAnimationShort;
  late final AnimationController _loopingAnimationLong;

  late Animatable<double> _scaleCurve;
  late Animatable<Offset> _slideCurve;
  late Animatable<Offset> _reverseSlide;
  late Animatable<double> _scaleCurveSlow;

  // late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _repeatingAnimationShort =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3600))
          ..repeat();
    _repeatingAnimationLong =
        AnimationController(vsync: this, duration: Duration(seconds: 15))
          ..repeat();
    _loopingAnimationShort =
        AnimationController(vsync: this, duration: Duration(milliseconds: 3600))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _loopingAnimationShort.reverse();
            }
            if (status == AnimationStatus.dismissed) {
              _loopingAnimationShort.forward();
            }
          })
          ..forward();
    _loopingAnimationLong =
        AnimationController(vsync: this, duration: Duration(seconds: 30))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _loopingAnimationShort.reverse();
            }
            if (status == AnimationStatus.dismissed) {
              _loopingAnimationShort.forward();
            }
          })
          ..forward();
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Align(
          alignment: Alignment.center,
          child: RotationTransition(
              alignment: Alignment.center,
              turns: _repeatingAnimationLong,
              child: GalaxyFitz())),
      //spinning hourglass
      //flying home
      //flying rocket
      //revolving rocket
      // Hidden button - stops time
      //Hidden button flings
    ]);
  }

  void setAnimatables() {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    _scaleCurve = CurveTween(curve: Curves.easeIn);
    _scaleCurveSlow = Tween<double>(begin: 0, end: 5);
    _slideCurve = Tween<Offset>(
        begin: Offset(-2, 2),
        end: Offset(
            deviceWidth / smallIconSize, -1 * deviceHeight / smallIconSize));
    _reverseSlide =
        Tween<Offset>(begin: Offset(deviceWidth / smallIconSize, 2));
  }
}

class TimeStopper extends StatelessWidget {
  late final List<AnimationController> controllers;

  TimeStopper({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          controllers.forEach((controller) {
            if (controller.isAnimating) {
              controller.stop();
            } else {
              controller.repeat();
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          height: 100,
          width: 100,
        ));
  }
}

// Takes the given controllers and flings them forward
class FlingButton extends StatelessWidget {
  final List<AnimationController> controllers;

  const FlingButton({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          controllers.forEach((controller) {
            controller.fling();
          });
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          height: 100,
          width: 100,
        ));
  }
}

class GalaxyFitz extends StatelessWidget {
  const GalaxyFitz({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/galaxy.png");
  }
}
// Explicit animations with AnimatedBuilder and AnimatedWidget
