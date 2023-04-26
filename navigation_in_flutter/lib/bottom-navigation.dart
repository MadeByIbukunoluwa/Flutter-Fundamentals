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

class TextPage extends StatefulWidget {
  const TextPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
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
  ///
  ///Cross Fading Destination Views
  /// Stack the destinations views, fade in the selected view, fade out the unselected view
  /// Once a destination has faded out we'll move it Offstage so that it's no longer rendered or hit tested
  /// To ensure that moving view offstage preserves their state, give them a Global Key
  ///
  ///
  ///
  List<AnimationController> _faders;
  List<Key> _destinationKeys;

  int _currentIndex = 0;
  
  @override
  void initState() {
    super.initState();

  _faders = allDestinations.map<AnimationController>((Destination destination) {
    return AnimationController(vsync: this,duration:Duration(milliseconds: 200))
  }).toList();

  _faders[_currentIndex].value = 1.0;

  _destinationKeys = List<Key>.generate(allDestinations.length, (int index) => GlobalKey()).toList();
  }


  @override 
  void dispose () {
    for (AnimationController controller in _faders)
        controller.dispose();
      super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //Normal version
    // return Scaffold(
    //   body: SafeArea(
    //       top: false,
    //       child: IndexedStack(
    //         index: _currentIndex,
    //         children: allDestinations.map<Widget>((Destination destination) {
    //           return DestinationView(destination: destination);
    //         }).toList(),
    //       )),
    //   bottomNavigationBar: BottomNavigationBar(
    //     currentIndex: _currentIndex,
    //     onTap: (index) {
    //       setState(() {
    //         _currentIndex = index;
    //       });
    //     },
    //     items: allDestinations.map((destination) {
    //       return BottomNavigationBarItem(
    //           icon: Icon(destination.icon),
    //           backgroundColor: destination.color,
    //           label: destination.title);
    //     }).toList(),
    //   ),
    // );
    //Cross Fading Demo 
      return Scaffold(
        body:SafeArea(
          top:false,
          child: Stack(
             fit:StackFit.expand,
             children: allDestinations.map((Destination destination) {
                final Widget view = FadeTransition(
                  opacity: _faders[destination].drive(CurveTween(curve: Curves.fastOutSlowIn)),
                  child:KeyedSubtree(
                    key: _destinationKeys[destination],
                    child:DestinationView(
                      destination: destination;
                    )
                  )
                );
              
             }).toList()
          )
        )
      );
  }
}

/**
 * Tapping any list item causes it to push a '/text route which will contain a TextPage widget
 */
class ListPage extends StatelessWidget {
  const ListPage({Key key, required this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const List<num> shades = [50, 00, 200, 300, 400, 500, 600, 700, 800, 900];
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color.shade50,
      body: SizedBox.expand(
        child: ListView.builder(
            itemCount: shades.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 128,
                child: Card(
                    color: destination.color.withOpacity(0.25),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/text');
                      },
                      child: Center(
                        child: Text('item $index',
                            style: Theme.of(context)
                                .primaryTextTheme
                                .displayMedium),
                      ),
                    )),
              );
            }),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key key, required this.destination}) : super(key: key);

  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(destination.title),
          backgroundColor: destination.color,
        ),
        backgroundColor: destination.color[50],
        body: SizedBox.expand(child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/list");
          },
        )));
  }
}

class DestinationView extends StatefulWidget {
  // const DestinationView({ Key key, required this.destination }) : super(key: key);
  const DestinationView({super.key, required this.destination});

  final Destination destination;

  @override
  State<DestinationView> createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case 'list':
                return ListPage(destination: widget.destination);
              case 'text':
                return TextPage(destination: widget.destination);
            }
          });
    });
  }
}
