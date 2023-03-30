import 'package:adaptive_app_demos/global/device_type.dart';
import 'package:flutter/material.dart';



class AppModel with ChangeNotifier {
   bool getDefaultTouchMode() => DeviceType.isMobile == true
   
}