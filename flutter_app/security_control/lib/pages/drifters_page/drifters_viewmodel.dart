import 'package:stacked/stacked.dart';
import 'package:security_control/models/gopigo.dart';
import 'package:security_control/services/service_locator.dart';
import 'package:security_control/services/server_sync_service.dart';

class DriftersViewModel extends BaseViewModel {
  String _title = "DriftersPage<temp>"; //TODO FINAL: replace temp title
  String get title => _title;
}

class MapSectionViewModel extends BaseViewModel {
  String _title = "Map Section ViewModel";
  double _boxHeight = 222.0;
  String _mapPath = "lib/images/gopigo_map.png";
  String get map => _mapPath;
  String get title => _title;
  double get height => _boxHeight;
}

class StatusSectionViewModel extends BaseViewModel {
  ServerSyncService _serverSyncService = locator<ServerSyncService>();
  String _statusSectionTitle = "'GoPiGo Section Here";
  String get statusSectionTitle => _statusSectionTitle;
  //TODO generate gopigolist from server
  List _gopigolist = <GoPiGo>[
    GoPiGo(
      1,
      'test car1',
      23,
    ),
    GoPiGo(
      2,
      'BoB',
      46,
    ),
    GoPiGo(
      3,
      'gopigo5',
      100,
    )
  ];
  initialise() {
    _serverSyncService.goPiGoListMap.listen((event) {
      _gopigolist = event.values.toList();
       notifyListeners();
    });
  }
  List<GoPiGo> get gopigolist => _gopigolist;
  double _animationHeight = 48.0;
  get animationHeight => _animationHeight;

  get duration => _duration;
  void updateDrifterBatterySetting(GoPiGo device, int newValue) {
    device.setBatteryLevel(newValue);
    notifyListeners();
  }

  Duration _duration = Duration(milliseconds: 100);
  void dosomething() {
    print('do something tap');
    _animationHeight = _animationHeight == 48 ? 200 : 48;
    notifyListeners();
  }

  void updateSettings() {
    print('update settings');
    //TODO save device settings
    notifyListeners();
  }
}

class GoPiGoSettingsViewModel extends BaseViewModel {
  GoPiGo _tempDevice = new GoPiGo(6666, 'device_kk', 5);
  GoPiGo _device;
  get name => _tempDevice.name;
  get batterylevel => _tempDevice.batterylevel;

  get id => _tempDevice.id;

  Object get device => _tempDevice;

  void sliderUpdate(int newValue) {
    _tempDevice.setBatteryLevel(newValue);
    notifyListeners();
  }

  void nameTextUpdate(String newText) {
    _tempDevice.setName(newText);
    notifyListeners();
  }

  //TODO there is a better way to do this?
  void setdevice(GoPiGo device) {
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

class GoHomeSectionViewModel extends BaseViewModel {
  String _buttonTitle = "Return Home";
  String get buttonTitle => _buttonTitle;

  void onPressed() {
    //TODO sendout return home call
    print('GoHome button notified');
    _buttonTitle = "Return Home call sent";
    notifyListeners();
  }
}
