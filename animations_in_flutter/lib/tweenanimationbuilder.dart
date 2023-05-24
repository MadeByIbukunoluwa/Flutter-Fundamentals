import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';


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
