import 'package:flutter/cupertino.dart';

enum ScreenType {
  Handset,
  Tablet,
  Desktop,
  Watch,
}

// using breakpoints we can set up a simple sysytem to determine the device type using breakpoints
class FormFactor {
  static double desktop = 900;
  static double tablet = 600;
  static double handset = 300;
}

ScreenType getFormFactor(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > FormFactor.desktop) return ScreenType.Desktop;
  if (deviceWidth > FormFactor.tablet) return ScreenType.Tablet;
  if (deviceWidth > FormFactor.handset) return ScreenType.Handset;
  return ScreenType.Watch;
}
// we could also abstract it more and define it in terms of small to large 
enum ScreenSize { Small, Normal, Large, ExtraLarge }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;

  if (deviceWidth > 900) return ScreenSize.ExtraLarge;
  if (deviceWidth > 600) return ScreenSize.Large;
  if (deviceWidth > 300) return ScreenSize.Normal;
  return ScreenSize.Small;
}


// Even though checking total screen size is great for full-screen pages or making global layout decisions, it’s often not ideal for nested subviews. Often, subviews have their own internal breakpoints and care only about the space that they have available to render.