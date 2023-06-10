import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const url =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';


class MyFadeInDemoApp extends StatelessWidget {
  const MyFadeInDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: FadeInDemo())),
    );
  }
}

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(url),
        TextButton(
            onPressed: () => {},
            child: Text(
              'Show Details',
              style: TextStyle(color: Colors.blueAccent),
            )),
        Column(
          children: [
            Text('Type: Owl'),
            Text('Age: 39'),
            Text('Employment: None'),
          ],
        )
      ],
    );
  }
}
