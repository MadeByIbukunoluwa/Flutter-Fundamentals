import 'package:adaptive_demos/global/device_type.dart';
import 'package:adaptive_demos/global/styling.dart';
import 'package:adaptive_demos/widgets/scroll_view_with_scrollbars.dart';
import 'package:flutter/material.dart';

class AdaptiveDataTablePage extends StatelessWidget {
  final List<int> items = List.generate(100, (index) => index);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      bool showCol2 = constraints.maxWidth > 300;
      bool showCol3 = constraints.maxWidth > 600;
      bool showCol4 = constraints.maxWidth > 900;
      return Column(
        children: [
          Row(
            children: [
              _TableHeader("Column 1"),
              if (showCol2) _TableHeader("Column 2"),
              if (showCol3) _TableHeader("Column 3"),
              if (showCol4) _TableHeader("Column 4"),
            ],
          ),
          Expanded(child: ScrollViewWithScroll)
        ],
      );
    });
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
      child: Padding(
          padding: EdgeInsets.all(Insets.medium),
          child: Text(label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))));
}

class _TableRowItem extends StatelessWidget {
  const _TableRowItem(this.label, {Key? key}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Insets.medium, vertical: Insets.extraLarge)),
      );
}
