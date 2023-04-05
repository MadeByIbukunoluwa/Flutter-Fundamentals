import 'package:flutter/material.dart';

class OrientationDemo extends StatefulWidget {
   @override
  _OrientationDemoState createState() => _OrientationDemoState();
}

class _OrientationDemoState extends State<OrientationDemo> { 
  var name = "Deven Joshi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? _buildVerticalLayout()
            : _buildHorizontalLayout();
      }),
    );
  }
}

Widget _buildVerticalLayout() {
  return Center(
    child: ListView(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(32.0),
          child: Icon(
            Icons.account_circle,
            size: 100.0,
          ),
        ),
        for (int index = 0; index < 8; index++)
          const Padding(
            padding: EdgeInsets.all(22.0),
            child: Text("Demo Data", style: TextStyle(fontSize: 32.0)),
          ),
      ],
    ),
  );
}

Widget _buildHorizontalLayout() {
  return Center(
    child: Row(children: <Widget>[
      Expanded(
          child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(32.0),
            child: Icon(
              Icons.account_circle,
              size: 100.0,
            ),
          ),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("name", style: TextStyle(fontSize: 32.0))),
        ],
      )),
      Expanded(
          child: ListView(
        scrollDirection: Axis.vertical,
        children: List.generate(6,
            //error here
            (n) {
          return const Padding(
              padding: EdgeInsets.all(22.0),
              child: Text(
                "name",
                style: TextStyle(fontSize: 32.0),
              ));
        }),
      ))
    ]),
  );
}


