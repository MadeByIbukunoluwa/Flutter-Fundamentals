// https://medium.com/flutter/getting-to-the-bottom-of-navigation-in-flutter-b3e440b9386

// title icon color

import 'package:flutter/material.dart';

class Destination {
  const Destination(this.title, this.icon, this.color);

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home, Colors.teal),
  Destination('Business', Icons.business, Colors.cyan),
  Destination('School', Icons.school, Colors.purple),
  Destination('Flight', Icons.flight, Colors.blue),
];

class DestinationView extends StatefulWidget {
  // const DestinationView({ Key key, required this.destination }) : super(key: key);
  const DestinationView({super.key, required this.destination});

  final Destination destination;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  TextEditingController? _textController;

  @override
  void initState() {
    super.initState();
    _textController =
        TextEditingController(text: 'sample text:${widget.destination.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.destination.title),
          backgroundColor: widget.destination.color,
        ),
        body: Container(
          padding: EdgeInsets.all(32.0),
          alignment: Alignment.center,
          child: TextField(
            controller: _textController,
          ),
        ));
  }

  @override
  void dispose() {
    _textController!.dispose();
    super.dispose();
  }
}

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


//  The homepage features a scaffold with a BottomNavigationBar for the destination views tapping on a destination (as in the BottomNavigationBarItem causes the homepage to rebuild with a new value for _currentIndex )
//   The indexed stack displys the destination view selected by the current index 

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _currentIndex,
            children: allDestinations.map<Widget>((Destination destination) {
              return DestinationView(destination: destination);
            }).toList(),
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            backgroundColor: destination.color,
            label: destination.title
          );
        }).toList(),
      ),
    );
  }
}


