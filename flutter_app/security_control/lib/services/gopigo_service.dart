import 'package:security_control/models/gopigo.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.dart';
import 'api.dart';

@lazySingleton
class GoPiGoService {
  final _api = locator<Api>();

  List<GoPiGo> _devices = [
    GoPiGo(id: 1, name: 'test car1', batterylevel: 27),
    GoPiGo(id: 2, name: 'BoB', batterylevel: 46),
    GoPiGo(id: 3, name: 'gopigo5', batterylevel: 100)
  ];
  List<GoPiGo> get devices => _devices;

  Future<List<GoPiGo>> getGoPiGoInfo() async {
    //TODO use api to get real list of devices
    // _devices = await _api.getGoPiGoInfo(deviceId);
    var _devices = [
      GoPiGo(id: 1, name: 'testcar1', batterylevel: 27),
      GoPiGo(id: 2, name: 'Bop', batterylevel: 46),
      GoPiGo(id: 3, name: 'gopo5', batterylevel: 100)
    ];
    return _devices;
  }
}
