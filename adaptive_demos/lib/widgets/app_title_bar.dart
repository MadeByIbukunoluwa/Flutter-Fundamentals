import 'package:adaptive_demos/app_model.dart';
import 'package:adaptive_demos/global/device_type.dart';
import 'package:adaptive_demos/global/styling.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLinuxOrWindows = DeviceType.isWindows || DeviceType.isLinux;
    bool enableTouch = context.select((AppModel m) => m.touchMode);
    bool useSmallHeader = MediaQuery.of(context).size.width < 400;
    bool hideTitle = MediaQuery.of(context).size.width < 400;
    TextStyle style = useSmallHeader ? TextStyles.h2 : TextStyles.h1;

    return Material(
        child: Stack(
      children: [
        Positioned.fill(child: Container(color: Colors.blue)),

        if (hideTitle == false)
          Positioned.fill(
              child: Center(
                  child: Text("Adaptive Scaffold",
                      style: style.copyWith(color: Colors.white)))),

        Positioned.fill(child: MoveWindow()),
        //Enable Touch Mode Button
        Row(
          // Shift the Touch button position to the right to avoid the native buttons
          textDirection:
              DeviceType.isMacOS ? TextDirection.rtl : TextDirection.ltr,
          children: [
            IconButton(
              onPressed: () => context.read<AppModel>().toggleTouchMode(),
              icon: Icon(enableTouch ? Icons.mouse : Icons.fingerprint),
            ),
            Spacer(),
          ],
        ),

        // Add window contrls for Linux/Windows
        if (isLinuxOrWindows) ...[
          Row(
            children: [
              Spacer(),
              MinimizeWindowButton(
                colors: buttonColors,
              ),
              MinimizeWindowButton(
                colors: buttonColors,
              ),
              CloseWindowButton(colors: closeButtonColors)
            ],
          )
        ]
      ],
    ));
  }
}

final buttonColors = WindowButtonColors(iconNormal: Colors.white);

final closeButtonColors = WindowButtonColors(iconNormal: Colors.white);
