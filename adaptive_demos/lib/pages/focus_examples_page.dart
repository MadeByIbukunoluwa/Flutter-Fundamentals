import 'package:adaptive_demos/global/styling.dart';
import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';


class FocusExamplesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Insets.extraLarge),
      child:Center(
        child:SeparatedColumn(
          separatorBuilder: () => SizedBox(height: 5),
          children: [
             // Basic widget that can accept traversal, built with FocusableActionDetector
            Text("BasicActionDetector"),
            BasicActionDetector(),
            SizedBox(height:10),

            //Clickable widget that can accept traversal, built with focusableActionDetector
            Text("AdvancedActionDetector"),
            ClickableActionDetector(),
            SizedBox(height: 10,)

            // A totally custom control, built by stacking together various widgets 
            Text("CustomControl:"),
            ClickableControl(),
            _TextListener(),
          ],
        )
      )
    );
  }
 }

// Example of a cusotm focus wiodget from scratch 

class ClickableControl extends StatelessWidget {





}

 class Logo extends StatelessWidget {
    const Logo({Key? key, required this.showBorder}) : super(key:key);
    final bool showBorder;


  @override
  Widget build(BuildContext context) {
    return Stack(
    clipBehavior:Clip.none,
    children:[
      FlutterLogo(size:100),
      //Focus Effect
      if (showBorder) Positioned(left:0,top:-4,bottom:-4,right:-4,child:_roundedBorder())
    ]
  );
  }
 }

 Widget _roundedBorder() => Container(
  decoration: BoxDecoration(
    border:Border.all(color:Colors.orange,),
      borderRadius:BorderRadius.circular(6)
  ),
 );