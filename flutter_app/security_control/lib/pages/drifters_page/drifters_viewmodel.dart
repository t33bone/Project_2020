import 'package:security_control/services/gopigo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:security_control/models/gopigo.dart';
import 'package:security_control/services/service_locator.dart';

class DriftersViewModel extends FutureViewModel<List<GoPiGo>> {
  final _gopigoService = locator<GoPiGoService>();
  @override
  Future<List<GoPiGo>> futureToRun() => _gopigoService.getGoPiGoInfo();
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

class StatusSectionViewModel extends DriftersViewModel {
  String _statusSectionTitle = "'GoPiGo Section Here";
  String get statusSectionTitle => _statusSectionTitle;
  List<GoPiGo> get gopigolist => _gopigoService.devices;

  void updateDrifterBatterySetting(GoPiGo device, int newValue) {
    device.setBatteryLevel(newValue);
    notifyListeners();
  }
}

class GoPiGoSettingsViewModel extends BaseViewModel {
  GoPiGo _tempDevice = new GoPiGo();
  GoPiGo _device;
  get name => _tempDevice.getName;
  get batterylevel => _tempDevice.getBatterylevel;

  get id => _tempDevice.getId;

  Object get device => _tempDevice;

  void sliderUpdate(int newValue) {
    _tempDevice.setBatteryLevel(newValue);
    notifyListeners();
  }

  void nameTextUpdate(String newText) {
    _tempDevice.setName(newText);
    notifyListeners();
  }

  void setdevice(GoPiGo device) {
    _tempDevice.setName(device.getName);
    _tempDevice.setId(device.getId);
    _tempDevice.setBatteryLevel(device.getBatterylevel);
    _device = device;
    print('setdevice ${device.getName}');
  }

  void updateSettings() {
    print('GoPiGoSettingsViewModel/updateSettings');
    _device.setBatteryLevel(_tempDevice.getBatterylevel);
    _device.setName(_tempDevice.getName);
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
