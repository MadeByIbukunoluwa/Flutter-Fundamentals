import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:navigation_in_flutter/navigator2.0.dart';

void main() {
  // runApp(const Nav2App());
  runApp(const BooksApp());
}
// note - you can also use named routes , but it is not recommended for most apllications

class Nav2App extends StatelessWidget {
  const Nav2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/details': (context) => DetailScreen(),
      // }
      // For the named routes, they must be predefined although you can arguments to a named route, you can't parse arguments from the route itself for example, if the app is run on the wen you can't parse the ID from the route like details/:id
      // you can advanced name routes with onGenerate
      //Here, settings is an instance of RouteSettings. The name and arguments fields are the values that were provided when Navigator.pushNamed was called, or what initialRoute is set to.
      onGenerateRoute: (settings) {
        //for handling '/
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => const HomeScreen());
        }
        //for handling 'details/:id
        // typecasted a non nullable String to a String

        var uri = Uri.parse(settings.name as String);

        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'details') {
          var id = uri.pathSegments[1];
          debugPrint(id);
          return MaterialPageRoute(builder: (context) => DetailScreen(id: id));
        }
        return MaterialPageRoute(builder: (context) => UnknownScreen());
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ElevatedButton(
          child: Text("View Details"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen();
            }));
            //Named Route
            // Navigator.pushNamed(context, '/details');
          },
        )));
  }
}

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//             child: ElevatedButton(
//           child: Text('Pop!'),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         )));
//   }
// }
class DetailScreen extends StatelessWidget {
  String? id;

  DetailScreen({this.id, super.key});
  // const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Viewing details for item $id'),
            ElevatedButton(
              child: Text('Pop!'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ]),
        ));
  }
}

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('404')),
    );
  }
}
