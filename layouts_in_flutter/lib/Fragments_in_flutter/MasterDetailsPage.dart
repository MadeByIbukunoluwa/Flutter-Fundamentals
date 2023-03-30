import 'package:flutter/material.dart';
import 'package:layouts_in_flutter/Fragments_in_flutter/ListWidget.dart';
import 'package:layouts_in_flutter/Fragments_in_flutter/DetailPage.dart';
import 'package:layouts_in_flutter/Fragments_in_flutter/DetailWidget.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailsPageState createState() => _MasterDetailsPageState();
}

class _MasterDetailsPageState extends State<MasterDetailPage> {
  var selectedValue = 0;
  var isLargeScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (MediaQuery.of(context).size.width > 600) {
              isLargeScreen = true;
            } else {
              isLargeScreen = false;
            }
            return Row(
              children: <Widget>[
                Expanded(
                    child: ListWidget(10, (value) {
                      // if the larger layout is used we don't need to go to a lrager screen to see the detailwidgets page, if the screen is smaller, we need to navigate to a different page as only the list is displayed on the current screen 
                  if (isLargeScreen) {
                    selectedValue = value;
                    setState(() {});
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailPage(value);
                    }));
                  }
                })
                ),
                // if the screen is large we add a detailWidget if it is not, we add an empty Container()
                isLargeScreen ? Expanded(child: DetailWidget(selectedValue)) : Container()
              ]);
          },
        ));
  }
}
