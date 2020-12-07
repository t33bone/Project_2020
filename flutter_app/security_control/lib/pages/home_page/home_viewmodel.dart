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
  String _serverOnline = "Online";
  String _serverOffline = "Offline";
  bool _serverConnected = true;
  String _noIntruders = "No intruders";
  String _intruders = "Intruder!";
  bool _intruderAlert = true;

  int get selectedDestination => _selectedDestination;
  String get accountName => _accountName;
  String get accountEmail => _accountEmail;
  String get serverOnline => _serverOnline;
  String get serverOffline => _serverOffline;
  bool get serverConnected => _serverConnected;
  String get noIntruders => _noIntruders;
  String get intruders => _intruders;
  bool get intruderAlert => _intruderAlert;

  List<MyDrawerItems> drawerItems = <MyDrawerItems>[
    const MyDrawerItems('Drifters', Icon(Icons.directions_car_rounded)),
    const MyDrawerItems('Drone', Icon(Icons.airplanemode_active_rounded)),
    const MyDrawerItems('Sensors', Icon(Icons.ac_unit)),
    const MyDrawerItems('Pictures', Icon(Icons.photo)),
    const MyDrawerItems('Settings', Icon(Icons.settings)),
    const MyDrawerItems('Logout', Icon(Icons.logout)),
    const MyDrawerItems(
        'Charge Station', Icon(Icons.airline_seat_legroom_extra)),
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
      case 5:
        _navigationService.navigateTo(Routes.loginPage);
        break;
      case 6:
        _navigationService.navigateTo(Routes.batteryStationPage);
        break;
    }
  }

  List<String> actionsRequired = <String>[
    'Call 112',
    'Run',
  ];

  List<Devices> devicesList = <Devices>[
    Devices(1, 'test car1', 23, true),
    Devices(2, 'BoB', 46, true),
    Devices(3, 'gopigo5', 100, false),
    Devices(4, 'Drone', 80, true),
    Devices(5, 'RuuviTag1', 25, false),
    Devices(6, 'RuuviTag2', 97, false),
    Devices(7, 'RuuviTag3', 64, false),
    Devices(8, 'Ruuvi4', 13, true),
    Devices(9, 'Auto7', 49, true),
  ];

  void showRequiredActions() {
    //Show required actions from list
  }
}

class MyDrawerItems {
  const MyDrawerItems(this.name, this.icon);
  final String name;
  final Icon icon;
}

class Devices {
  Devices(this.id, this.name, this.batterylevel, this.connected);
  final int id;
  final String name;
  final int batterylevel;
  final bool connected;
}
