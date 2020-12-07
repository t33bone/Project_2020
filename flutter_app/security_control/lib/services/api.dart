import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:security_control/models/gopigo.dart';
import 'package:security_control/models/photo.dart';
import 'package:security_control/models/ruuvitag.dart';

/// The service responsible for networking requests
@lazySingleton
class Api {
  //TODO
  static const endpoint = ' ';

  var client = new http.Client();

  Future<GoPiGo> getGoPiGo(int deviceId) async {
    var response = await client.get('$endpoint/users/$deviceId');
    return GoPiGo.fromJson(json.decode(response.body));
  }

  Future<List<GoPiGo>> getGoPiGoInfo(int userId) async {
    var devices = List<GoPiGo>();
    var response = await client.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var device in parsed) {
      devices.add(GoPiGo.fromJson(device));
    }
    return devices;
  }

  Future<RuuviTag> getRuuviTag(int deviceId) async {
    var response = await client.get('$endpoint/users/$deviceId');
    return RuuviTag.fromJson(json.decode(response.body));
  }

  Future<List<RuuviTag>> getRuuviTagInfo(int userId) async {
    var devices = List<RuuviTag>();
    var response = await client.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var device in parsed) {
      devices.add(RuuviTag.fromJson(device));
    }
    return devices;
  }
}
