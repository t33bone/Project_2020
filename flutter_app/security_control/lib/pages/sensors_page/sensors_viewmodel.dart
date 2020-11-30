import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:security_control/models/ruuvitag.dart';

class SensorsViewModel extends BaseViewModel {
  String _title = "SensorsPage<temp>"; //TODO FINAL: replace temp title
  String get title => _title;
}

class StatusSectionViewModel extends BaseViewModel {
  String _statusSectionTitle = "'Ruuvitag Section Here";
  String get statusSectionTitle => _statusSectionTitle;
  //TODO generate _ruuvitaglist from server
  final _ruuvitaglist = <RuuviTag>[
    RuuviTag(id: 1, name: 'test1', batterylevel: 23),
    RuuviTag(id: 2, name: 'test2', batterylevel: 46),
    RuuviTag(id: 3, name: 'test14', batterylevel: 100),
    RuuviTag(id: 1, name: 'test15', batterylevel: 27)
  ];
  List<RuuviTag> get gopigolist => _ruuvitaglist;
}

class RuuviTagSettingsViewModel extends BaseViewModel {
  RuuviTag _tempDevice =
      new RuuviTag(id: 6666, name: 'device_kk', batterylevel: 5);
  RuuviTag _device;
  get name => _tempDevice.name;
  get batterylevel => _tempDevice.batterylevel;

  get id => _tempDevice.id;

  Object get device => _tempDevice;

  void sliderUpdate(double newValue) {
    _tempDevice.setBatteryLevel(newValue);
    notifyListeners();
  }

  void nameTextUpdate(String newText) {
    _tempDevice.setName(newText);
    notifyListeners();
  }

  //TODO there is a better way to do this?
  void setdevice(RuuviTag device) {
    _tempDevice.setName(device.name);
    _tempDevice.setId(device.id);
    _tempDevice.setBatteryLevel(device.batterylevel);
    _device = device;
    print('setdevice ${device.name}');
  }

  //TODO there is a better way to do this?
  void updateSettings() {
    print('GoPiGoSettingsViewModel/updateSettings');
    _device.setBatteryLevel(_tempDevice.batterylevel);
    _device.setName(_tempDevice.name);
  }
}
