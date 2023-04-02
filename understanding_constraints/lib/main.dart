import 'package:flutter/material.dart';

void main() => runApp(HomePage());

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = const TextStyle(fontSize: 30);

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => FlutterLayoutArticle(
          // Here we have a list of examples of the type <Example>
          <Example>[
            Example1(),
            Example2(),
            Example3(),
            Example4(),
            Example5(),
            Example6(),
            Example7(),
            Example8(),
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
  // late / lazy initialization of varibles , they will be evaluated only when they are accessed
  late int count;
  late Widget example;
  late String code;
  late String explanation;

  @override
  // we are overriding the initState widget lifecyle method to write our own logic inside it
  void initState() {
    // this method is called whrn this obejct inserterd into the tree, here
    // after we have initialized the varibales in the body of the class , we are now , assigning intitial values to them
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
          showExample(exampleNumber, widget.examples[exampleNumber - 1].code,
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

class Example2 extends Example {
  final String code = "Container(width: 100, height: 100, color: red)";

  final String explanation =
      "The red Container wants to be 100x100, but it can't, "
      "because the screen forces it to be exactly the same size of the screen."
      "\n\n"
      "So the Container fills the screen.";
  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 100, color: red);
  }
}

class Example3 extends Example {
  final String code = "Center(\n"
      "   child: Container(width: 100, height: 100, color: red))";

  final String explanation =
      "The screen forces the Center to be exactly the same size of the screen."
      "\n\n"
      "So the Center fills the screen."
      "\n\n"
      "The Center tells the Container it can be any size it wants, but not bigger than the screen."
      "\n\n"
      "Now the Container can indeed be 100x100.";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(width: 100, height: 100, color: red),
    );
  }
}

class Example4 extends Example {
  final String code = "Align(\n"
      "   alignment: Alignment.bottomRight,\n"
      "   child: Container(width: 100, height: 100, color: red))";

  final String explanation =
      "This is different from the previous example in that it uses Align instead of Center."
      "\n\n"
      "The Align also tells the Container it can be any size it wants, but if there is empty space it will not center the Container, "
      "but will instead align it to the bottom-right of the available space.";

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        // alignment: Alignment.center,
        child: Container(
          width: 100,
          height: 100,
          color: red,
        ));
  }
}

class Example5 extends Example {
  final String code = "Center(\n"
      "   child: Container(\n"
      "              color: red,\n"
      "              width: double.infinity,\n"
      "              height: double.infinity))";

  final String explanation =
      "The screen forces the Center to be exactly the same size of the screen."
      "\n\n"
      "So the Center fills the screen."
      "\n\n"
      "The Center tells the Container it can be any size it wants, but not bigger than the screen."
      "\n\n"
      "The Container wants to be of infinite size, but since it can't be bigger than the screen it will just fill the screen.";
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: double.infinity, height: double.infinity, color: red));
  }
}

class Example6 extends Example {
  final String code = "Center(child: Container(color: red))";

  final String explanation =
      "The screen forces the Center to be exactly the same size of the screen."
      "\n\n"
      "So the Center fills the screen."
      "\n\n"
      "The Center tells the Container it is free to be any size it wants, but not bigger than the screen."
      "\n\n"
      "Since the Container has no child and no fixed size, it decides it wants to be as big as possible, so it fits the whole screen."
      "\n\n"
      "But why does the Container decide that? "
      "Simply because that's a design decision by those who created the Container widget. "
      "It could have been created differently, and you actually have to read the Container's documentation to understand what it will do depending on the circumstances. ";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: red),
    );
  }
}

class Example7 extends Example {
  final String code = "Center(\n"
      "   child: Container(color: red\n"
      "      child: Container(color: green, width: 30, height: 30)))";

  final String explanation =
      "The screen forces the Center to be exactly the same size of the screen."
      "\n\n"
      "So the Center fills the screen."
      "\n\n"
      "The Center tells the red Container it can be any size it wants, but not bigger than the screen."
      "\n\n"
      "Since the red Container has no size but has a child, it decides it wants to be the same size of its child."
      "\n\n"
      "The red Container tells its child that if can be any size it wants, but not bigger than the screen."
      "\n\n"
      "The child happens to be a green Container, that wants to be 30x30."
      "\n\n"
      "As said, the red Container will size itself to its children size, so it will also be 30x30. "
      "No red color will be visible, since the green Container will occupy all of the red Container.";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: red,
        child: Container(
          color: green,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}

class Example8 extends Example {
  final String code = "Center(\n"
      "   child: Container(color: red\n"
      "      padding: const EdgeInsets.all(20.0),\n"
      "      child: Container(color: green, width: 30, height: 30)))";

  final String explanation =
      "The red Container will size itself to its children size, but it takes its own padding into consideration. "
      "So it will also be 30x30, plus a 20x20 padding. "
      "The red color will be visible because of the padding, and the green Container will have the same size as the previous example.";

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        padding: const EdgeInsets.all(20.0),
        color:red,
        child:Container(color:green,width:30,height:30,),
      )
    );
  }
}
