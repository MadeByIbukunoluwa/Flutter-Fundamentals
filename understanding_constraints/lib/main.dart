import 'package:flutter/material.dart';

void main() => runApp(HomePage());

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = const TextStyle(fontSize: 30);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlutterLayoutArticle(<Example>[
        Example1(),
        // Example2(),
        // Example3(),
        // Example4(),
        // Example5(),
        // Example6(),
        // Example7(),
        // Example8(),
        // Example9(),
        // Example10(),
        // Example11(),
        // Example12(),
        // Example13(),
        // Example14(),
        // Example15(),
        // Example16(),
        // Example17(),
        // Example18(),
        // Example19(),
        // Example20(),
        // Example21(),
        // Example22(),
        // Example23(),
        // Example24(),
        // Example25(),
        // Example26(),
        // Example27(),
        // Example28(),
        // Example29(),
      ]);
}

abstract class Example extends StatelessWidget {
  const Example({super.key});

  String get code;

  String get explanation;
}

class FlutterLayoutArticle extends StatefulWidget {
  final List<Example> examples;

  FlutterLayoutArticle(this.examples);

  @override
  _FlutterLayoutArticleState createState() => _FlutterLayoutArticleState();
}

class _FlutterLayoutArticleState extends State<FlutterLayoutArticle> {
  late int count;
  late Widget example;
  late String code;
  late String explanation;

  @override
  void initState() {
    count = 1;
    code = Example1().code;
    explanation = Example1().explanation;

    super.initState();
  }

  @override
  void didUpdateWidget(FlutterLayoutArticle oldWidget) {
    super.didUpdateWidget(oldWidget);
    var example = widget.examples[count - 1];
    code = example.code;
    explanation = example.explanation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Layout Article',
        home: SafeArea(
            child: Material(
                color: Colors.black,
                child: FittedBox(
                    child: Container(
                  width: 400,
                  height: 670,
                  color: Color(0xFFCCCCCC),
                  child: Column(children: [
                    Expanded(
                        child: ConstrainedBox(
                            constraints: BoxConstraints.tightFor(
                                width: double.infinity,
                                height: double.infinity),
                            child: widget.examples[count - 1])),
                    Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.black,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            for (int i = 0; i < widget.examples.length; i++)
                              Container(
                                  width: 58,
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4.0),
                                  child: button(i + 1))
                          ]),
                        )),
                    Container(
                        height: 273,
                        color: Colors.grey[200],
                        child: Scrollbar(
                            child: SingleChildScrollView(
                          key: ValueKey(count),
                          child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Center(child: Text(code)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(explanation,
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontStyle: FontStyle.italic))
                                ],
                              )),
                        )))
                  ]),
                )))));
  }

  Widget button(int exampleNumber) => Button(
        key: ValueKey("Button$exampleNumber"),
        isSelected: this.count == exampleNumber,
        exampleNumber: exampleNumber,
        onPressed: () {
          showExample(
            exampleNumber, 
              widget.examples[exampleNumber - 1].code,
              widget.examples[exampleNumber - 1].explanation);
        },
      );

  void showExample(int exampleNumber, String code, String explanation) {
    setState(() {
      this.count = exampleNumber;
      this.code = code;
      this.explanation = explanation;
    });
  }
}

class Button extends StatelessWidget {
  final Key key;
  final bool isSelected;
  final int exampleNumber;
  final VoidCallback onPressed;

  Button(
      {required this.key,
      required this.isSelected,
      required this.exampleNumber,
      required this.onPressed})
      : super(key: key);
  Widget build(BuildContext context) {
    return MaterialButton(
        color: isSelected ? Colors.grey : Colors.grey[800],
        child: Text(exampleNumber.toString(),
            style: TextStyle(color: Colors.white)),
        onPressed: () {
          Scrollable.ensureVisible(context,
              duration: Duration(milliseconds: 350),
              curve: Curves.easeOut,
              alignment: 0.5);
          onPressed();
        });
  }
}

class Example1 extends Example {
  final String code = "Container(color:red)";

  final String explanation = "The screen is the parent of the Container."
      "It forces the red Container to be exactly the same size of the screen"
      "\n\n"
      "So the Container fills the screen and it gets all red.";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: red,
    );
  }
}
