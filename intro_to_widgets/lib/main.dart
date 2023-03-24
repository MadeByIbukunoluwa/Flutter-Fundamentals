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

void main() {
  runApp(const MaterialApp(
    title: 'My app',
    home: SafeArea(
      child: MyScaffold(),
    ),
  ));
}

