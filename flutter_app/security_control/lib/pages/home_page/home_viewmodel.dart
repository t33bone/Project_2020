import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/services/service_locator.dart';

import 'home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  NavigationService _navigationService = locator<NavigationService>();
  int _selectedDestination = 0;
  String _accountName = "Test User";
  String _accountEmail = "TestUser@email.com";

  int get selectedDestination => _selectedDestination;
  String get accountName => _accountName;
  String get accountEmail => _accountEmail;

  List<MyDrawerItems> devices = <MyDrawerItems>[
    const MyDrawerItems('Drifters', Icon(Icons.directions_car_rounded)),
    const MyDrawerItems('Drone', Icon(Icons.airplanemode_active_rounded)),
    const MyDrawerItems('Sensors', Icon(Icons.ac_unit)),
    const MyDrawerItems('Pictures', Icon(Icons.photo)),
    const MyDrawerItems('Settings', Icon(Icons.settings)),
  ];

  void drawerItemOnPressed(int i) {
    switch (i) {
      case 0:
        _navigationService.navigateTo(Routes.driftersPage);
        break;
      case 1:
        _navigationService.navigateTo(Routes.dronePage);
        break;
      case 2:
        _navigationService.navigateTo(Routes.sensorsPage);
        break;
      case 3:
        _navigationService.navigateTo(Routes.picturesPage);
        break;
      case 4:
        _navigationService.navigateTo(Routes.settingsPage);
        break;
    }
  }

/*   void selectDestination(int index) {
    _selectedDestination = index;
    notifyListeners();
  }
 */
  void driftersButtonOnPressed() {
    _navigationService.navigateTo(Routes.driftersPage);
  }

  void picturesButtonOnPressed() {
    _navigationService.navigateTo(Routes.picturesPage);
  }

  void settingsButtonOnPressed() {
    _navigationService.navigateTo(Routes.settingsPage);
  }
}

class MyDrawerItems {
  const MyDrawerItems(this.name, this.icon);
  final String name;
  final Icon icon;
}
