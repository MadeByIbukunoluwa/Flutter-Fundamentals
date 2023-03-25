import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     const Center(
//       child:Text(
//         'Hello, world',
//         textDirection:TextDirection.ltr,
//       ),
//     ),
//   );
// }

// With normal widgets
// class MyAppBar extends StatelessWidget {
//   const MyAppBar({required this.title, super.key});
//   final Widget title;
//   // Fields in a Wigdet subclass are always marked "final"
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 56.0,
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         child: Row(
//           children: [
//             const IconButton(
//               icon: Icon(Icons.menu),
//               tooltip: 'Navigation menu',
//               onPressed: null,
//             ),
//             Expanded(
//               child: title,
//             ),
//             const IconButton(
//               icon: Icon(Icons.search),
//               tooltip: 'Search',
//               onPressed: null,
//             )
//           ],
//         ));
//   }
// }

// class MyScaffold extends StatelessWidget {
//   const MyScaffold({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//         child: Column(
//       children: [
//         MyAppBar(
//             title: Text(
//           'Example Title',
//           style: Theme.of(context).primaryTextTheme.titleLarge,
//         )),
//         const Expanded(child: Center(child: Text('Hello,world')))
//       ],
//     ));
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//     title: 'My app',
//     home: SafeArea(
//       child: MyScaffold(),
//     ),
//   ));
// }

//Using Material Components

// void main() {
//   runApp(const MaterialApp(
//     title: 'Flutter Tutorial',
//     home: TutorialHome(),
//   ));
// }

// class TutorialHome extends StatelessWidget {
//   const TutorialHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: const IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation Menu',
//             onPressed: null,
//           ),
//           title: const Text('Example title'),
//           actions: const [
//             IconButton(
//               icon: Icon(Icons.search),
//               onPressed: null,
//             )
//           ]),
//       body: const Center(
//         child: Text('hello world'),
//       ),
//       floatingActionButton: const FloatingActionButton(
//         tooltip: 'Add',
//         onPressed: null,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }
//Handling Gestures
// Lets build a basic button which detects input gestures

// class MyButton extends StatelessWidget {
//   const MyButton({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('MyButton was Tapped');
//       },
//       child: Container(
//           height: 50.0,
//           padding: const EdgeInsets.all(8.0),
//           margin: const EdgeInsets.symmetric(horizontal: 8.0),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5.0),
//             color: Colors.lightGreen[500],
//           ),
//           child: const Center(
//             child: Text('Engage'),
//           )),
//     );
//   }
// }

// void main() {
//   runApp(
//     const MaterialApp(
//       home:Scaffold(
//         body:Center(
//           child:MyButton(),
//         )
//       )
//     )
//     );
// }

//Changing widgets in reponse to input

// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;

//   void _increment() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         ElevatedButton(
//           onPressed: _increment,
//           child: const Text('increment'),
//         ),
//         const SizedBox(width: 16),
//         Text('Count: $_counter'),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//       home: Scaffold(
//           body: Center(
//     child: Counter(),
//   ))));
// }

// more complex example
// in this example, there is creation of new stateless widgets , cleanly separating theconcerns of displaying the counter and chnaging the counter

// class CounterDisplay extends StatelessWidget {
//   const CounterDisplay({required this.count, super.key});

//   final int count;

//   @override
//   Widget build(BuildContext context) {
//     return Text('Count: $count');
//   }
// }

// class CounterIncrementor extends StatelessWidget {
//   const CounterIncrementor({required this.onPressed, super.key});

//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(onPressed: onPressed, child: const Text('Increment'));
//   }
// }

// class Counter extends StatefulWidget {
//   const Counter({super.key});

//   @override
//   State<Counter> createState() => _CounterState();
// }

// class _CounterState extends State<Counter> {
//   int _counter = 0;

//   void _increment() {
//     setState(() {
//       ++_counter;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         CounterIncrementor(onPressed: _increment),
//         const SizedBox(width: 16),
//         CounterDisplay(count: _counter),
//       ],
//     );
//   }
// }

// void main() {
//   runApp(const MaterialApp(
//       home: Scaffold(
//           body: Center(
//     child: Counter(),
//   ))));
// }

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          onCartChanged(product, inCart);
        },
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          child: Text(product.name[0]),
        ),
        title: Text(product.name, style: _getTextStyle(context)));
  }
}

void main() {
  runApp(
    MaterialApp(
      home:Scaffold(
        body:Center(
          child:ShoppingListItem(
            product: const Product(name:'Chips'),
            inCart:true,
            onCartChanged: (product, inCart) {},
            )
          )
      )
    )
  );
}

