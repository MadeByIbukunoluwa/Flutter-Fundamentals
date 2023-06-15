import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

// If all you need are callbacks with the flexibility of Actions and Shortcuts , you canuse the callback shorcuts widget
// It is not working on MacOS for some reasom
class ShortCutDemo extends StatelessWidget {
  const ShortCutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Shortcut App Demo'),
      ),
      body: ShortcutWidget(),
    ));
  }
}

class ShortcutWidget extends StatefulWidget {
  const ShortcutWidget({super.key});

  @override
  State<ShortcutWidget> createState() => _ShortcutWidgetState();
}

class _ShortcutWidgetState extends State<ShortcutWidget> {
  @override
  Widget build(BuildContext context) {
    int count = 0;
    return CallbackShortcuts(
        bindings: <ShortcutActivator, VoidCallback>{
          const SingleActivator(LogicalKeyboardKey.arrowUp): () {
            setState(() => count = count + 1);
          },
          const SingleActivator(LogicalKeyboardKey.arrowDown): () {
            setState(() => count = count + 1);
          }
        },
        child: Focus(
            autofocus: true,
            child: Center(
              child: Container(
                height:100,
                width:double.maxFinite,
                child: Column(
                  children: <Widget>[
                    Expanded(child:Text('Press the up arrow key to add to the counter')),
                    Expanded(child:Text(
                            'Press the down arrow key to subtract from the counter')),
                   
                    Text('count : $count')
                  ],
                ),
              ),
            )));
  }
}
