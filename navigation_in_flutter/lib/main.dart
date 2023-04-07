import 'package:flutter/material.dart';

void main() {
  runApp(const Nav2App());
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

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ElevatedButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        )));
  }
}
