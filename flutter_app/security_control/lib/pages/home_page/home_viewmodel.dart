import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/services/service_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  NavigationService _navigationService = locator<NavigationService>();
  String _appBarTitle = "Security Control";
  String _accountName = "Test User";
  String _accountEmail = "TestUser@email.com";
  double _avatarFontSize = 40.0;
  String _serverConnectionLabel = "Server connection";
  String _securityStatusLabel = "Security Status";
  double _labelFontSize = 25.0;
  String _serverOnline = "Online";
  String _serverOffline = "Offline";
  bool _serverConnected = true;
  String _noIntruders = "No intruders";
  String _intruders = "Intruder!";
  String _actionRequiredLabel = " action(s) required";
  String _noActionRequiredLabel = "Everything OK";
  bool _intruderAlert = true;
  String _deviceConnected = "CONNECTED";
  String _deviceDisconnected = "DISCONNECTED";

  String get appBarTitle => _appBarTitle;
  String get accountName => _accountName;
  String get accountEmail => _accountEmail;
  double get avatarFontSize => _avatarFontSize;
  String get serverConnectionLabel => _serverConnectionLabel;
  String get securityStatusLabel => _securityStatusLabel;
  double get labelFontSize => _labelFontSize;
  String get serverOnline => _serverOnline;
  String get serverOffline => _serverOffline;
  bool get serverConnected => _serverConnected;
  String get noIntruders => _noIntruders;
  String get intruders => _intruders;
  bool get intruderAlert => _intruderAlert;
  String get actionRequiredLabel => _actionRequiredLabel;
  String get noActionRequiredLabel => _noActionRequiredLabel;
  String get deviceConnected => _deviceConnected;
  String get deviceDisconnected => _deviceDisconnected;

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
    'testtesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttesttest',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
    'test',
  ];

  List<Devices> devicesList = <Devices>[
    Devices(1, 'test car1', 24, true),
    Devices(2, 'BoB', 46, true),
    Devices(3, 'gopigo5', 100, false),
    Devices(4, 'Drone', 80, true),
    Devices(5, 'RuuviTag1', 25, false),
    Devices(6, 'RuuviTag2', 97, false),
    Devices(7, 'RuuviTag3', 64, false),
    Devices(8, 'Ruuvi4', 13, true),
    Devices(9, 'Auto7', 49, true),
  ];

  showRequiredActionsDialog(BuildContext context) {
    Widget clearButton = FlatButton(
      child: Text("CLEAR ALL"),
      onPressed: () {
        Navigator.of(context).pop();
        //clear actionsrequired
      },
    );
    Widget backButton = FlatButton(
      child: Text("BACK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog actions = AlertDialog(
      scrollable: true,
      title: Text("Required action(s)"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: actionsRequired.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(actionsRequired[index]),
                    onTap: () {
                      //POST MESSAGE CLEARED WITH ID
                      clearMessageDialog(context);
                    });
              },
            ),
          ),
        ],
      ),
      actions: [
        backButton,
        clearButton,
      ],
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return actions;
      },
    );
  }

  clearMessageDialog(BuildContext context) {
    Widget noButton = FlatButton(
      child: Text("NO"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget yesButton = FlatButton(
      child: Text("YES"),
      onPressed: () {
        Navigator.of(context).pop();
        //clear message with id
      },
    );
    AlertDialog clearMessage = AlertDialog(
      content: Text('Are you sure you want to clear this message?'),
      actions: [
        noButton,
        yesButton,
      ],
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return clearMessage;
      },
    );
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
