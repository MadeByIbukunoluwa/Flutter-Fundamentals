import 'package:adaptive_demos/app_model.dart';
import 'package:adaptive_demos/global/device_size.dart';
import 'package:adaptive_demos/global/styling.dart';
import 'package:adaptive_demos/pages/adaptive_data_table_page.dart';
import 'package:adaptive_demos/pages/adaptive_grid_page.dart';
import 'package:adaptive_demos/pages/adaptive_reflow_page.dart';
import 'package:adaptive_demos/pages/focus_examples_page.dart';
import 'package:adaptive_demos/pages/login_page.dart';
import 'package:adaptive_demos/widgets/buttons.dart';
import 'package:adaptive_demos/widgets/ok_cancel_dialog.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'widgets/app_title_bar.dart';
import 'global/targeted_actions.dart';

List<Widget> getMainMenuChildren(BuildContext context) {
  // Define a method to change pages in the AppModel

  void changePage(int value) => context.read<AppModel>().selectedIndex = value;
  int index = context.select((AppModel m) => m.selectedIndex);
  return [
    SelectedPageButton(
      onPressed: () => changePage(0),
      label: "Adaptive Grid",
      isSelected: index == 0,
    ),
    SelectedPageButton(
      onPressed: () => changePage(0),
      label: "Adaptive Data Table",
      isSelected: index == 1,
    ),
    SelectedPageButton(
      onPressed: () => changePage(0),
      label: "Adaptive Reflow",
      isSelected: index == 2,
    ),
    SelectedPageButton(
      onPressed: () => changePage(0),
      label: "Focus Examples",
      isSelected: index == 3,
    ),
  ];
}

//Uses a tab navigation + drawer, or a side menu that combines both

class MainAppScaffold extends StatefulWidget {
  @override
  _MainAppScaffoldState createState() => _MainAppScaffoldState();
}

class _MainAppScaffoldState extends State<MainAppScaffoldState> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  Widget build(BuildContext context) {
    bool useTabs = MediaQuery.of(context).size.width < FormFactor.tablet;
    bool isLoggedOut = context.select((AppModel m) => m.isLoggedIn) = false;
    return TargetedActionScope(
       
    )
  }
}




class _SideMenu extends StatelessWidget {
  const _SideMenu({Key? key, this.showPageButtons = true}) : super(key: key);

  final bool showPageButtons;

  @override
  Widget build(BuildContext context) {
    void _handleLogoutPressed() async {
      String message = "Are you sure you want to logout?";
      bool? doLogout = await showDialog(context: context,builder:(_)=> OkCancelDialog(message: message));
      if (doLogout ?? false) {
          context.read<AppModel>().logout();
      }
    }
    return Container(
        color: Colors.white,
        width:250,
        child:Stack(
          children: [
            Column(
              children: [
                SizedBox(height: Insets.extraLarge,),
                if (showPageButtons) ...getMainMenuChildren(context),
                SizedBox(height: Insets.extraLarge,),
                SecondaryMenuButton(label:"Submenu Item 1 "),
                SecondaryMenuButton(label:"Submenu Item 1 "),
                SecondaryMenuButton(label:"Submenu Item 1 "),
                Spacer(),
                OutlinedButton(
                child: Text("Logout"),
                onPressed: _handleLogoutPressed,
                ),
                SizedBox(height:Insets.large,)
              ],),
              //Divider
              Align(
                alignment:Alignment.centerRight,
                child:Container(width:1,height:double.infinity,color:Colors.blue)
              )
          ],
        )
    );
  }
}


















class _TabMenu extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    List<Expanded> tabButtons = getMainMenuChildren(context).map((btn) => Expanded(child: btn)).toList();
    return Column(
        children: [
          //Top divider
          Container(width: double.infinity,height: 1,color: Colors.blue,),
          //Tab buttons 
          Row(children: tabButtons,)
        ],
    );
  }
}