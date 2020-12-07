import 'package:security_control/services/gopigo_service.dart';
import 'package:stacked/stacked.dart';
import 'package:security_control/models/gopigo.dart';
import 'package:security_control/services/service_locator.dart';
import 'package:security_control/services/server_sync_service.dart';

class DriftersViewModel extends BaseViewModel {
  var _serverSyncService = locator<ServerSyncService>();
  List _gopigolist;
  @override
  //Future<List<GoPiGo>> futureToRun() => _gopigoService.getGoPiGoInfo();
  String _title = "DriftersPage<temp>"; //TODO FINAL: replace temp title
  List get gopigolist => _gopigolist;
  String get title => _title;
  initialise(){
    _serverSyncService.goPiGoListMapStream.listen((event) {
      _gopigolist = event.values.toList();
      notifyListeners();
    });

    _gopigolist = _serverSyncService.goPiGoListMap.values.toList();
  }

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

  void updateDrifterBatterySetting(GoPiGo device, int newValue) {
    device.setBatteryLevel(newValue);
    notifyListeners();
  }
}

class GoPiGoSettingsViewModel extends BaseViewModel {
  GoPiGo _tempDevice = new GoPiGo.empty();
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

  void setdevice(GoPiGo device) {
    _tempDevice.setName(device.name);
    _tempDevice.setId(device.id);
    _tempDevice.setBatteryLevel(device.batterylevel);
    _device = device;
    print('setdevice ${device.name}');
  }

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
