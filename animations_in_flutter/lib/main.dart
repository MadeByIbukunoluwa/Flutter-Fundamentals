import 'package:flutter/material.dart';
import 'package:animations_in_flutter/dynamicallymodifytweenvalues.dart';
import 'package:animations_in_flutter/implicitanimations.dart';
import 'package:animations_in_flutter/tweenanimationbuilder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:animations_in_flutter/creatingcustomexplicitanimations.dart';
import 'package:animations_in_flutter/animationdeepdive.dart';
import 'package:flutter/scheduler.dart';
// import 'package:flutter/src/animation/tween.dart';
import 'dart:math';

// https://medium.com/flutter/directional-animations-with-built-in-explicit-animations-3e7c5e6fbbd7

// https://github.com/afitz0/spinning_time/blob/master/lib/main.dart

//variables declared as static final variables are done so that they would not be rebuilt everytime

void main() {
  // runApp(MyAppHome());
  runApp(MyAnimatedApp());
  // var ticker = Ticker((elapsed) => print('hello'));
  // ticker.start();
  // ticker.dispose();
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
    with TickerProviderStateMixin {
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
    setAnimatables();
    return Stack(children: <Widget>[
      Align(
          alignment: Alignment.center,
          child: RotationTransition(
              alignment: Alignment.center,
              turns: _repeatingAnimationLong,
              child: GalaxyFitz())),
      //spinning hourglass
      Align(
        alignment: Alignment.center,
        child: ScaleTransition(
            scale: _loopingAnimationShort.drive(_scaleCurve),
            child: RotationTransition(
                turns: _repeatingAnimationShort,
                child: Icon(Icons.hourglass_empty,
                    size: largeIconSize, color: Colors.white))),
      ),
      //flying home
      Align(
        alignment: Alignment.bottomLeft,
        child: SlideTransition(
            position: _loopingAnimationShort.drive(_slideCurve),
            child: RotationTransition(
                turns: _repeatingAnimationShort,
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: smallIconSize,
                ))),
      ),
      //flying rocket
      Align(
        alignment: Alignment.bottomLeft,
        child: SlideTransition(
            position: _loopingAnimationShort.drive(_reverseSlide),
            child: RotationTransition(
                turns: _repeatingAnimationShort,
                child: Text("🚀", style: TextStyle(fontSize: smallIconSize)))),
      ),
      //revolving rocket
      Align(
          alignment: Alignment(0.75, 0),
          child: RotationTransition(
              turns: _repeatingAnimationLong,
              alignment: Alignment(-10, 0),
              child: RotationTransition(
                  turns: _repeatingAnimationShort,
                  child:
                      Text("🚀", style: TextStyle(fontSize: smallIconSize))))),
      // Hidden button - stops time
      Align(
        alignment: Alignment.bottomLeft,
        child: TimeStopper(controllers: [
          _repeatingAnimationLong,
          _repeatingAnimationShort,
          _loopingAnimationShort,
          _loopingAnimationLong,
        ]),
      ),
      //Hidden button flings
      Align(
          alignment: Alignment.bottomRight,
          child: FlingButton(controllers: [_loopingAnimationShort]))
    ]);
  }

  void setAnimatables() {
    double deviceHeight = MediaQuery.of(context).size.height;
    //This error happened because i put the setAnimatables function in the initState method, i fixed this by putting it in the widget build method
//  exception has occurred.
// FlutterError (dependOnInheritedWidgetOfExactType<MediaQuery>() or dependOnInheritedElement() was called before _TimeMachineState.initState() completed.
// When an inherited widget changes, for example if the value of Theme.of() changes, its dependent widgets are rebuilt. If the dependent widget's reference to the inherited widget is in a constructor or an initState() method, then the rebuilt dependent widget will not reflect the changes in the inherited widget.
// Typically references to inherited widgets should occur in widget build() methods. Alternatively, initialization based on inherited widgets can be placed in the didChangeDependencies method, which is called after initState and whenever the dependencies change thereafter.)
    double deviceWidth = MediaQuery.of(context).size.width;

    _scaleCurve = CurveTween(curve: Curves.easeIn);
    _scaleCurveSlow = Tween<double>(begin: 0, end: 5);
    _slideCurve = Tween<Offset>(
        begin: Offset(-2, 2),
        end: Offset(
            deviceWidth / smallIconSize, -1 * deviceHeight / smallIconSize));
    _reverseSlide = Tween<Offset>(
      begin: Offset(deviceWidth / smallIconSize, 2),
      end: Offset(-2, -1 * deviceHeight / smallIconSize),
    );
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
