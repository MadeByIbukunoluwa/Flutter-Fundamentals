import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

// https://medium.com/flutter/custom-implicit-animations-in-flutter-with-tweenanimationbuilder-c76540b47185
// https://medium.com/flutter/directional-animations-with-built-in-explicit-animations-3e7c5e6fbbd7
// https://github.com/afitz0/spinning_time/blob/master/lib/main.dart

//variables decalred as static final variables are done so that they would not be rebuitlt everytime
void main() {
  // runApp(MyWidget());
  // runApp(ColorAnimationWithStaticFinal());
  // runApp(OngoingAnimationByModifyingEndTweenValue());
  runApp(_TimeMachine());
}

// implicit animations
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool _bigger = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // we can add some animation to this widget by switching the Container widget for an AnimatedContainer Widget and specifying an animation duration
            // Container(
            //   width:_bigger ? 100 : 500,
            //   child:Image.asset('');
            // ),
            AnimatedContainer(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.purple, Colors.transparent],
                        stops: [_bigger ? 0.2 : 0.5, 1.0])),
                // curve: Curves.easeInOutQuint,
                curve: SineCurve(count: 2),
                width: _bigger ? 100 : 500,
                child: Image.asset('assets/images/star2.png'),
                duration: Duration(seconds: 1)),
            ElevatedButton(
                onPressed: () => setState(() {
                      _bigger = !_bigger;
                    }),
                child: Icon(Icons.star))
          ],
        ));
  }
}

//This is an example of a custom curve , that is the sine curve that uses the sine fucntion to make our curve bounce
class SineCurve extends Curve {
  final double count;

  SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}

//Custom implicit animations with TweenAnimationBuilder
// this is an EXTREMELY bare bones illustration of using TweenAnimationBuilder
// This example is for illustration use only, an implict rotation animation can be achievd with AnimatedContainer

class SuperBasic extends StatelessWidget {
  const SuperBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/'),
        Center(
            child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 2 * pi),
          duration: Duration(seconds: 2),
          builder: (BuildContext context, double angle, Widget? child) {
            return Transform.rotate(
              angle: angle,
              child: Image.asset('assets/'),
            );
          },
        ))
      ],
    );
  }
}

class ColorAnimationWithStaticFinal extends StatelessWidget {
  // The argument type ColorTween cannot be assigned to Tween<Color>
  // static final colorTween = ColorTween(begin: Colors.white, end: Colors.red) ;
  // static final colorTween =
  //Runtime Error
  // _CastError (type 'ColorTween' is not a subtype of type 'Tween<Color>' in type cast)
  // ColorTween(begin: Colors.white, end: Colors.red) as Tween<Color>;

  static final colorTween = ColorTween(begin: Colors.white, end: Colors.red);
  // https://stackoverflow.com/questions/68509559/colortween-not-working-in-tweenanimationbuilder

  //Cannot lerp between "Color(0xffffffff)" and "MaterialColor(primary value: Color(0xfff44336))".

  // ErrorHint('To lerp colors, consider ColorTween instead.')
  static final starsBackground =
      Image.asset('assets/images/starsbackground.jpg');
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: <Widget>[
            starsBackground,
            Center(
                child: TweenAnimationBuilder<Color?>(
                    tween: colorTween,
                    duration: Duration(seconds: 1),
                    builder: (_, Color? color, __) {
                      return ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              color ?? Colors.transparent, BlendMode.modulate),
                          child: Image.asset('assets/images/sun.png'));
                    }))
          ],
        ));
  }
}

//Dynamically modifying Tween Values
// We can do more by dynamically modifying our own tween values

class OngoingAnimationByModifyingEndTweenValue extends StatefulWidget {
  const OngoingAnimationByModifyingEndTweenValue({super.key});

  @override
  State<OngoingAnimationByModifyingEndTweenValue> createState() =>
      _OngoingAnimationByModifyingEndTweenValueState();
}

class _OngoingAnimationByModifyingEndTweenValueState
    extends State<OngoingAnimationByModifyingEndTweenValue> {
  double _newValue = .4;
  Color? _newColor = Colors.white;

  static final starsBackground =
      Image.asset('assets/images/starsbackground.jpg');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Dynamically modifying value')),
          body: Stack(
            children: <Widget>[
              starsBackground,
              Column(
                children: <Widget>[
                  Center(
                      child: TweenAnimationBuilder<Color?>(
                          tween:
                              ColorTween(begin: Colors.white, end: _newColor),
                          duration: Duration(milliseconds: 2),
                          builder: (_, Color? color, __) {
                            return ColorFiltered(
                              // everytime the color changes flutter has to rebuild the image, the only way to  chnage this is by passing it in as a child widget
                              child: Image.asset('assets/images/sun.png'),
                              colorFilter: ColorFilter.mode(
                                  color ?? Colors.transparent,
                                  BlendMode.modulate),
                            );
                          }))
                ],
              ),
              Slider.adaptive(
                  value: _newValue,
                  onChanged: (double value) {
                    setState(() {
                      _newValue = value;
                      _newColor = Color.lerp(Colors.white, Colors.red, value);
                    });
                  })
            ],
          ),
        ));
  }
}

// ErrorHint(
//           'No MediaQuery ancestor could be found starting from the context '
//           'that was passed to MediaQuery.of(). This can happen because you '
//           'have not added a WidgetsApp, CupertinoApp, or MaterialApp widget '
//           '(those widgets introduce a MediaQuery), or it can happen if the '
//           'context you use comes from a widget above those widgets.',
//         ),

// need to fix size issues

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

  Animatable<double> _scaleCurve;
  Animatable<Offset> _slideCurve;
  Animatable<Offset> _reverseSlide;
  Animatable<double> _scaleCurveSlow;

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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(
          children: <Widget>[
      Align(
          alignment: Alignment.center,
          child: RotationTransition(
            alignment: Alignment.center,
            turns: _animation,
            child: Image.asset("assets/images/galaxy.png"),
          ))
    ]));
  }
}

class TimeStopper extends StatelessWidget {
  late final AnimationController controller;

  TimeStopper({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (controller.isAnimating) {
            controller.stop();
          } else {
            controller.repeat();
          }
        },
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent),
          height: 100,
          width: 100,
        ));
  }
}

// Explicit animations with AnimatedBuilder and AnimatedWidget
