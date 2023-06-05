// Creating custom explicit animations with AnimatedBuilder and AnimatedWidget

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// https://medium.com/flutter/when-should-i-useanimatedbuilder-or-animatedwidget-57ecae0959e8

// we want to write an app with an alien spaeship and a spaceship animation

class MyAppHome extends StatelessWidget {
  const MyAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final Image starsBackground = Image.asset(
    "assets/images/starsbackground.jpg",
  );
  final Image ufo = Image.asset(
    "assets/images/ufo1.png",
    height: 400,
    width: 400,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.fill,
          child: starsBackground,
        ),
        ClipPath(
            clipper: const BeamClipper(),
            child: Container(
              height: 1000,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      radius: 1.5,
                      colors: [Colors.yellow, Colors.transparent])),
            )),
        ufo
      ],
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();
  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

// we want to create a beam shaped animation that will be repeated starting from the center of the Ufo but their is no inbuilt widgets for funnel shaped gradients so we will use Animated Gradient , we will wrap the graident code inisde the AnimatedBuilder , we're also ging to use a controller to drive the animation , we create the controller in the initState instead of the buildMethod, because we don't want to create the contrller multiple times 







