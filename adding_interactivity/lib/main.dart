import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Adding_Interactivity',
        home: Scaffold(
          appBar: AppBar(title: const Text('Adding_Interactivity')),
          body: Center(
            child: TapBoxA(),
            // child: FavoriteWidget(),
          ),
        ));
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: EdgeInsets.all(0),
            child: IconButton(
              icon: (_isFavorited
                  ? const Icon(Icons.star)
                  : Icon(Icons.star_border_outlined)),
              color: Colors.red[500],
              onPressed: _toggleFavorite,
            )),
        SizedBox(child: Text('$_favoriteCount'))
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}

// Case 1 : The widget manages its own state
class TapBoxA extends StatefulWidget {
  const TapBoxA({super.key});

  @override
  State<TapBoxA> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
        child: Center(
            child: Text(
          _active ? 'Active' : 'Inactive',
          style: const TextStyle(fontSize: 32.0, color: Colors.white),
        )),
      ),
    );
  }
}
// Case 2
// Parent widget manages the state and tells its child when to update
// it can export export its state to its parent through a callback

class TapBoxBContainer extends StatefulWidget {
  const TapBoxBContainer({super.key});

  @override
  State<TapBoxBContainer> createState() => _TapBoxBState();
}

class _TapBoxBState extends State<TapBoxBContainer> { 
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TapBoxB(
          active:_active,
          onChanged:_handleTapboxChanged,
        ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  const TapBoxB({
    super.key, 
    this.active = false, 
    required this.onChanged
    });

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _handleTap,
        child: Container(
          width:200.0,
          height:200.0,
          decoration: BoxDecoration(
            color:active ? Colors.lightGreen[700] :Colors.grey[600]
          ),
          child:Center(
            child:Text(
                active ? 'Active' : 'Inactive',
                style:const TextStyle(fontSize: 32.0,color:Colors.white)
            )
          )
        ),
    );
  }
}



// A mix and match approach 

