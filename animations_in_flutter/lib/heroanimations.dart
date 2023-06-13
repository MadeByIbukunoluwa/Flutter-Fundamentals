import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero ({super.key,
      required this.onTap,
      required this.photo,
      required this.width});

  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child:Hero(
          tag:photo,
          child: Material(
            color:Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child:Image.asset(
                photo,
                fit:BoxFit.contain,
              )
            ),
        )
      )
    );
  }
}





