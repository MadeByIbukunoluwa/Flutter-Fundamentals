import 'package:flutter/material.dart';

class MediaQueryExample extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MediaQueryExample> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      drawer: media.width < 600 ? Drawer(child: Menu()) : null,
      body: Row(children: <Widget>[
        media.width > 600 ? Flexible(flex: 1, child: Menu()) : Container(),
        Flexible(
            child: Center(
                child: Text(
          "Size ${media.width.floor()} * ${media.height.floor()}",
          style: Theme.of(context).textTheme.titleMedium,
        ))),
      ]),
    );
  }
}

class Menu extends StatelessWidget {
  // const Menu({super.key});
   final List<String> list = ["Home", "Profile", "Calls", "Messages"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
            height: 150.0,
            color: Colors.green,
            child: Center(child: Text('Ibukunoluwa Akintobi'))),
        for (int index = 0; index < 4; index++)
          ListTile(
            title: Text(list[index]),
            onTap: () {},
          )
      ],
    );
  }
}
