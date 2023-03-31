import 'package:flutter/material.dart';


//Single source of truth for styling 
// You'll probably find it easier to style views of you create a single source of truth for styling padding,spacing, corner shapes etc
// This can be done with helper classes 
// The constants can then be used in the position of hard coded values 
class Insets {
  static double medium = 5;
  static double large = 10;
  static double extraLarge = 20;
  static double small = 3;
}

class TextStyles {
  static TextStyle buttonText1 =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 14);
  static TextStyle buttonText2 =
      TextStyle(fontWeight: FontWeight.normal, fontSize: 11);
  static TextStyle h1 =
   TextStyle(fontWeight: FontWeight.bold, fontSize: 22);
  static TextStyle h2 = 
  TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
}
