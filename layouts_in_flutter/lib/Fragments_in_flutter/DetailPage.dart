import 'package:flutter/material.dart';
import 'package:layouts_in_flutter/Fragments_in_flutter/DetailWidget.dart';


// DetailPage , used for displaying data on smaller screens it onlyholds one detailWidhet 
class DetailPage extends StatefulWidget {
  final int data;

  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:DetailWidget(widget.data)
    );
  }
}