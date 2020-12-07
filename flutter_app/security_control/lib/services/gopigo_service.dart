import 'package:security_control/models/gopigo.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.dart';
import 'package:security_control/services/server_sync_service.dart';

@lazySingleton
class GoPiGoService {

  List<GoPiGo> _devices = [
    GoPiGo(1, 'test car1', 27),
    GoPiGo(2, 'BoB', 46),
    GoPiGo(3, 'gopigo5', 100)
  ];

  ServerSyncService _serverSyncService = locator<ServerSyncService>();

  List<GoPiGo> get devices => _devices;

  Future<List<GoPiGo>> getGoPiGoInfo() async {
    //TODO use api to get real list of devices
    // _devices = await _api.getGoPiGoInfo(deviceId);
    var _devices = [
      GoPiGo(1, 'testcar1', 27),
      GoPiGo(2, 'Bop', 46),
      GoPiGo(3, 'gopo5', 100)
    ];
    return _devices;
  }
}
