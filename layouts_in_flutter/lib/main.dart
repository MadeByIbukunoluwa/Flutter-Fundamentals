import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout Demo',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter layout demo'),
          ),
          body: Center(child: buildHomePage('Strawberry Pavlova Recipe'))),
    );
  }

// Row and Column
  Widget buildRow() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image.asset('images/pic1.jpg'),
          ),
          Expanded(
            flex: 2,
            child: Image.asset('images/pic2.jpg'),
          ),
          Expanded(
            child: Image.asset('images/pic3.jpg'),
          )
        ],
      );

  Widget buildColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image.asset('images/pic1.jpg'),
          ),
          Expanded(
            child: Image.asset('images/pic2.jpg'),
          ),
          Expanded(
            child: Image.asset('images/pic3.jpg'),
          )
        ],
      );
  // Nesting rows and columns
// The Pavlova example runs best horizontally on a wide device, such as a tablet. If you are running this example in the iOS simulator, you can select a different device using the Hardware > Device menu. For this example, we recommend the iPad Pro. You can change its orientation to landscape mode using Hardware > Rotate. You can also change the size of the simulator window (without changing the number of logical pixels) using Window > Scale.
//its not mobile friendly
  Widget buildHomePage(String title) {
    const titleText = Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
            fontWeight: FontWeight.w800, letterSpacing: 0.5, fontSize: 30),
      ),
    );
    const subTitle = Text(
      'pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. Pavlova features a crisp crust and soft, light inside, '
      'topped with fruit and whipped cream.',
      textAlign: TextAlign.center,
      style: TextStyle(fontFamily: 'Georgia', fontSize: 25),
    );
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black)
      ],
    );
    final ratings = Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            stars,
            const Text('170 reviews',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Roboto',
                  fontSize: 20,
                ))
          ],
        ));

    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 18,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
        style: descTextStyle,
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.kitchen, color: Colors.green[500]),
                    const Text('PREP:'),
                    const Text('25 min')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.timer, color: Colors.green[500]),
                    const Text('COOK:'),
                    const Text('1 hr')
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.kitchen, color: Colors.green[500]),
                    const Text('FEEDS:'),
                    const Text('4-6')
                  ],
                ),
              ],
            )));
    final leftColumn = Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(children: [
          titleText,
          subTitle,
          ratings,
          iconList,
        ]));
    final mainImage = Image.asset('images/pavlova.jpg', fit: BoxFit.cover);
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
            child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          height: 600,
          child: Card(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 440,
                child: leftColumn,
              ),
              mainImage
            ]),
          ),
        )));
  }

  //Commmon Layout widgets
  //Container
  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(),
      color: Colors.black26,
      child: Column(children: [
        _buildImageRow(1),
        _buildImageRow(3),
      ]),
    );
  }

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.black38),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          margin: const EdgeInsets.all(4),
          child: Image.asset('images/pic$imageIndex.jpg')));

  Widget _buildImageRow(int imageIndex) => Row(
        children: [
          _buildDecoratedImage(imageIndex),
          _buildDecoratedImage(imageIndex + 1),
        ],
      );
}
