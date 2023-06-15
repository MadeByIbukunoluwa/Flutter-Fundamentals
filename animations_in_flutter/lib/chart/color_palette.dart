import 'dart:math';
import 'package:flutter/material.dart';

//operator overloading was used here in dart
//https://medium.com/@dumazy/enhance-your-classes-with-operator-overloading-in-dart-f1124bd813a0

class ColorPalette {

  static final ColorPalette primary = ColorPalette(<Color?>[
    Colors.blue[400],
    Colors.red[400],
    Colors.green[400],
    Colors.yellow[400],
    Colors.purple[400],
    Colors.orange[400],
    Colors.teal[400],
  ]);

  //assert that the colors list is not empty
  ColorPalette(List<Color?> colors) : _colors = colors {
    assert(colors.isNotEmpty);
  }

  final List<Color?> _colors;

  Color? operator [] (int index) => _colors[index % length];

  int get length => _colors.length;

  // Takes in a random number as an argument and returns 
  Color? random(Random random) => this[random.nextInt(length)];

}
