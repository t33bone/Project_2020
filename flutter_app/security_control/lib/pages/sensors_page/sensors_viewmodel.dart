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
    RuuviTag(
      id: 1,
      name: 'test1',
      batterylevel: 23,
      temperature: 25.0,
      humidity: 15,
      pressure: 20,
    ),
    RuuviTag(
      id: 2,
      name: 'test2',
      batterylevel: 46,
      temperature: 30.0,
      humidity: 30,
      pressure: 195,
    ),
    RuuviTag(
      id: 3,
      name: 'test14',
      batterylevel: 100,
      temperature: 16.0,
      humidity: 80,
      pressure: 100,
    ),
    RuuviTag(
      id: 1,
      name: 'test15',
      batterylevel: 27,
      temperature: -10.0,
      humidity: 5,
      pressure: 10,
    ),
  ];
  List<RuuviTag> get gopigolist => _ruuvitaglist;
}

class RuuviTagSettingsViewModel extends BaseViewModel {
  RuuviTag _tempDevice = new RuuviTag(
    id: 6666,
    name: 'device_kk',
    batterylevel: 5,
    temperature: 20,
    humidity: 15,
    pressure: 150,
  );
  RuuviTag _device;
  get name => _tempDevice.name;
  get batterylevel => _tempDevice.batterylevel;
  get temperature => _tempDevice.temperature;
  get humidity => _tempDevice.humidity;
  get pressure => _tempDevice.pressure;

  get id => _tempDevice.id;

  Object get device => _tempDevice;

  //GET CURRENT RANGE VALUES (lowerLimit,upperLimit)
  RangeValues _currentRangeValues = RangeValues(-10, 30);

  temperatureRangeSlider(BuildContext context) {
    Widget temperatureLimitSlider = RangeSlider(
        values: _currentRangeValues != null
            ? _currentRangeValues
            : RangeValues(0, 30),
        min: -100,
        max: 100,
        divisions: 200,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          sliderUpdate('uppertemp', values.end);
          _currentRangeValues = values;

          //setLowerTempLimit = values.start;
          //setUpperTempLimit = values.end;
        });
    return temperatureLimitSlider;
  }

  void sliderUpdate(String type, double newValue) {
    switch (type) {
      case 'battery':
        _tempDevice.setBatteryLevel(newValue);
        break;
      case 'uppertemp':
        _tempDevice.setTemperatureLimit(newValue);
        //_tempDevice.setUpperTemperatureLimit(newValue);
        break;
      case 'lowertemp':
        //_tempDevice.setLowerTemperatureLimit(newValue);
        break;
      case 'humidity':
        _tempDevice.setHumidityLimit(newValue);
        break;
      case 'pressure':
        _tempDevice.setPressureLimit(newValue);
        break;
    }
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
    _tempDevice.setTemperatureLimit(device.temperature);
    _tempDevice.setHumidityLimit(device.humidity);
    _tempDevice.setPressureLimit(device.pressure);
    _device = device;
    print('setdevice ${device.name}');
  }

  //TODO there is a better way to do this?
  void updateSettings() {
    print('GoPiGoSettingsViewModel/updateSettings');
    _device.setBatteryLevel(_tempDevice.batterylevel);
    _device.setTemperatureLimit(_tempDevice.temperature);
    _device.setHumidityLimit(_tempDevice.humidity);
    _device.setPressureLimit(_tempDevice.pressure);
    _device.setName(_tempDevice.name);
  }
}
