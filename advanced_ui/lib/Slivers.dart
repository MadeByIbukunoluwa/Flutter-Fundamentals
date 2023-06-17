// https://medium.com/flutter/slivers-demystified-6ff68ab0296f
//https://www.kindacode.com/article/flutter-finding-x-and-y-coordinates-of-a-widget-at-runtime/
// https://stackoverflow.com/questions/60528815/flutter-how-to-scroll-to-a-specific-item-position-in-sliverlist
//https://diamantidis.github.io/2021/10/10/exploring-flutter-scrollable-ensurevisible
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SliverApp extends StatelessWidget {
  const SliverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Collapsing List Demo')),
      body: CollapsingList(),
    ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
      {required double this.minHeight,
      required double this.maxHeight,
      Widget? this.child});

  final double minHeight;
  final double maxHeight;
  final Widget? child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(minHeight, maxHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatefulWidget {
  const CollapsingList({super.key});

  @override
  State<CollapsingList> createState() => _CollapsingListState();
}

class _CollapsingListState extends State<CollapsingList> {
  late ScrollController _controller;

  double? _x, _y;

  final GlobalKey key1 = GlobalKey();
  final GlobalKey key2 = GlobalKey();
  final GlobalKey key3 = GlobalKey();
  final GlobalKey key4 = GlobalKey();

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  // best thing we can do here is
  // in the function , we would have a
  _scrollToHeader(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    }
  }
  Widget makeHeader(String headerText, GlobalKey key) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          maxHeight: 200.0,
          minHeight: 60.0,
          child: GestureDetector(
              onTap: () => _scrollToHeader(key),
              child: Container(
                color: Colors.lightBlueAccent,
                child: Center(child: Text(headerText)),
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color generateRandomColor() {
      Random random = Random();
      int r = random.nextInt(256);
      int g = random.nextInt(256);
      int b = random.nextInt(256);
      return Color.fromARGB(255, r, g, b);
    }

    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        makeHeader('Header Section 1', key1),
        SliverGrid.count(
            key: key1,
            crossAxisCount: 3,
            children: List.generate(
                9,
                (i) => Container(
                      color: generateRandomColor(),
                      height: 150.0,
                    ))),
        makeHeader('Header Section 2', key2),
        SliverFixedExtentList(
          key: key2,
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(List.generate(
              5,
              (i) => Container(
                    color: generateRandomColor(),
                  ))),
        ),
        makeHeader('Header Section 3', key3),
        SliverGrid(
          key: key3,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate((BuildContext context, index) {
            return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'));
          }, childCount: 20),
        ),
        makeHeader('Header Section 4', key4),
        SliverList(
          key: key4,
          delegate: SliverChildListDelegate(List.generate(
              5,
              (i) => Container(
                    color: generateRandomColor(),
                    height: 150.0,
                  ))),
        )
      ],
    );
  }
}
