import 'package:flutter/material.dart';

class ConstantScrollBehavior extends ScrollBehavior {
  @override
  Widget buildScrollbar(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;

  @override
  Widget buildOverScrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
  @override
  TargetPlatform getPlatform(BuildContext context) => TargetPlatform.macOS;

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
}
