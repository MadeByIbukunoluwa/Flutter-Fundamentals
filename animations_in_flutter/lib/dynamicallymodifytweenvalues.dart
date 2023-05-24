import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

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
    return Stack(
      children: <Widget>[
        starsBackground,
        Column(
          children: <Widget>[
            Center(
                child: TweenAnimationBuilder<Color?>(
                    tween: ColorTween(begin: Colors.white, end: _newColor),
                    duration: Duration(milliseconds: 2),
                    builder: (_, Color? color, __) {
                      return ColorFiltered(
                        // everytime the color changes flutter has to rebuild the image, the only way to  chnage this is by passing it in as a child widget
                        child: Image.asset('assets/images/sun.png'),
                        colorFilter: ColorFilter.mode(
                            color ?? Colors.transparent, BlendMode.modulate),
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
    );
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