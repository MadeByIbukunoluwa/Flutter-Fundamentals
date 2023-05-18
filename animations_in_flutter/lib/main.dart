import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

// https://medium.com/flutter/custom-implicit-animations-in-flutter-with-tweenanimationbuilder-c76540b47185
void main() {
  // runApp(MyWidget());
  // runApp(ColorAnimationWithStaticFinal());
  runApp(OngoingAnimationByModifyingEndTweenValue());
}

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

// there is isn't a built in widget that applies an arbitrary color filter to a widget , but we can build one with TweenAnimationBuilder , to change the color over time, we want to modify the color we are applying to the filter
// A Tween is just the range of values we are animating between

// Tweens are mutable, so if you're always going to animate between the same set of value, its best to declare the Tween asa a sttatic final variable in your class , that way you don;t create a new object everyitm your build

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
        home: Scaffold(
          appBar: AppBar(title: const Text('Dynamically modifying value')
      ),
      body: Stack(
        children: <Widget>[
          starsBackground,
          Column(
            children: <Widget>[
              Center(
                  child: TweenAnimationBuilder<Color?>(
                      tween: ColorTween(begin: Colors.white, end: _newColor),
                      duration: Duration(seconds: 2),
                      builder: (_, Color? color, __) {
                        return ColorFiltered(
                          child: Image.asset('assets/images/sun.png'),
                          colorFilter: ColorFilter.mode(
                              color ?? Colors.transparent, BlendMode.modulate),
                        );
                      }))
            ],
          ),
          // Slider widgets require a Material widget ancestor.
// In Material Design, most widgets are conceptually "printed" on a sheet of material. In Flutter's material library, that material is represented by the Material widget. It is the Material widget that renders ink splashes, for instance. Because of this, many material library widgets require that there be a Material widget in the tree above them.

// To introduce a Material widget, you can either directly include one, or use a widget that contains Material itself, such as a Card, Dialog, Drawer, or Scaffold.
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