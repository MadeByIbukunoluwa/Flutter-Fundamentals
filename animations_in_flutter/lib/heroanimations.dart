import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

//https://docs.flutter.dev/ui/animations/hero-animations
class MyHero extends StatelessWidget {
  const MyHero({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeroAnimation(),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {super.key, this.onTap, required this.photo, required this.width});

  final String photo;
  final VoidCallback? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: Hero(
            tag: photo,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: onTap,
                  child: Image.asset(
                    photo,
                    fit: BoxFit.contain,
                  )),
            )));
  }
}

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    String photo = 'assets/images/flippers-alpha.png';

    return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Animation'),
        ),
        body: Center(
          child: PhotoHero(
              photo: photo,
              width: 300.0,
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Flippers Page'),
                    ),
                    body: Container(
                        color: Colors.lightBlueAccent,
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            PhotoHero(
                                photo: photo,
                                width: 100.0,
                                onTap: () {
                                  Navigator.of(context).pop();
                                }),
                                Text('This is a Flipper!!!')
                          ],
                        )),
                  );
                }));
              }),
        ));
  }
}
