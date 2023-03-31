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

  void chnagePage(int value) => context.read<AppModel>().selectedIndex = value;
  int index = context.select((AppModel m) => m.selectedIndex);
  return [
    SelectedPageButton()
  ];
}
