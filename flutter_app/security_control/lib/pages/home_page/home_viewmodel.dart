import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/services/service_locator.dart';

import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier{
  NavigationService _navigationService = locator<NavigationService>();

  void driftersButtonOnPressed(){
    _navigationService.navigateTo(Routes.driftersPage);
  }

  void picturesButtonOnPressed(){
    _navigationService.navigateTo(Routes.picturesPage);
  }

  void settingsButtonOnPressed(){
    _navigationService.navigateTo(Routes.settingsPage);
  }

}