import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/services/service_locator.dart';

class SubSettingsViewModel extends ChangeNotifier {

  NavigationService _navigationService = locator<NavigationService>();

  String _serverSettingsLabel = "Server settings";
  String _notificationSettingsLabel = "Notifications";
  String _sensorSettingsLabel = "Sensor settings";
  String _appearanceSettingsLabel = "Appearance settings";

  String get serverSettingsLabel => _serverSettingsLabel;
  String get notificationSettingsLabel => _notificationSettingsLabel;
  String get sensorSettingsLabel => _sensorSettingsLabel;
  String get appearanceSettingsLabel => _appearanceSettingsLabel;

  // Notifications
  bool _receiveNotifications = true;
  bool _receiveIntruderAlerts = true;
  bool _receiveLowBatteryAlerts = true;
  String _receiveNotificationsLabel = "Receive push notifications";
  String _intruderAlertsLabel = "Intruder alerts";
  String _lowBatteryAlertsLabel = "Low battery alerts";

  bool get receiveNotifications => _receiveNotifications;
  bool get receiveIntruderAlerts => _receiveIntruderAlerts;
  bool get receiveLowBatteryAlerts => _receiveLowBatteryAlerts;
  String get receiveNotificationsLabel => _receiveNotificationsLabel;
  String get intruderAlertsLabel => _intruderAlertsLabel;
  String get lowBatteryAlertsLabel => _lowBatteryAlertsLabel;

  setReceiveNotifications(bool enabled){
    _receiveNotifications = enabled;
    notifyListeners();
  }

  setReceiveIntruderAlerts(bool enabled){
    _receiveIntruderAlerts = enabled;
    notifyListeners();
  }

  setReceiveLowBatteryAlerts(bool enabled){
    _receiveLowBatteryAlerts = enabled;
    notifyListeners();
  }

  // Server settings:
  String _serverUpdateIntervalLabel = "Update interval (s)";
  double _serverUpdateInterval = 5;
  double _maxServerUpdateInterval = 120;
  double _minServerUpdateInterval = 1;
  TextEditingController _serverAddressEditingController = new TextEditingController();
  String _serverAddress = "192.168.0.1";
  String _serverAddressDialogTitle = "Set server address";
  String _serverAddressDialogHintLabel = "E.g. 192.168.0.1";
  String _serverAddressDialogConfirmButtonLabel = "APPLY";
  String _serverAddressDialogCancelButtonLabel = "CANCEL";
  String _serverAddressLabel = "Server address";

  String get serverUpdateIntervalLabel => _serverUpdateIntervalLabel;
  double get serverUpdateInterval => _serverUpdateInterval;
  double get maxServerUpdateInterval => _maxServerUpdateInterval;
  double get minServerUpdateInterval => _minServerUpdateInterval;
  TextEditingController get serverAddressEditingController => _serverAddressEditingController;
  String get serverAddressDialogTitle => _serverAddressDialogTitle;
  String get serverAddressDialogHintLabel => _serverAddressDialogHintLabel;
  String get serverAddressDialogConfirmButtonLabel => _serverAddressDialogConfirmButtonLabel;
  String get serverAddressDialogCancelButtonLabel => _serverAddressDialogCancelButtonLabel;
  String get serverAddressLabel => _serverAddressLabel;
  String get serverAddress => _serverAddress;

  setServerAddress(){
    _serverAddress = _serverAddressEditingController.text;
    notifyListeners();
  }
  setServerUpdateInterval(double value){
    _serverUpdateInterval = value;
    notifyListeners();
  }

}