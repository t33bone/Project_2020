import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/services/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PicturesViewModel extends ChangeNotifier {
  NavigationService _navigationService = locator<NavigationService>();
  String _testImg = "lib/images/test_img.png";
  String _deviceName = "testDevice123";
  String _dateAndTime = "dateAndTime123";

  String get testImg => _testImg;
  String get deviceName => _deviceName;
  String get dateAndTime => _dateAndTime;

  void galleryButtonOnPressed() {
    _navigationService.navigateTo(Routes.galleryPage);
  }
}
