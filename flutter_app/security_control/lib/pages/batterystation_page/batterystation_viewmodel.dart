import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:security_control/models/gopigo.dart';
import 'package:security_control/services/gopigo_service.dart';
import 'package:security_control/services/service_locator.dart';

class BatterystationViewModel extends FutureViewModel<List<GoPiGo>> {
  final _gopigoService = locator<GoPiGoService>();
  @override
  Future<List<GoPiGo>> futureToRun() => _gopigoService.getGoPiGoInfo();
  String _title = "Batterystation<temp>";
  String get title => _title;
}

class StatusSectionViewModel extends BatterystationViewModel {
  String _statusSectionTitle = "Latest Charger";
  String get statusSectionTitle => _statusSectionTitle;

  GoPiGo get recentDevice => _gopigoService.devices.first; //TODO

}

class HistorySectionViewModel extends BatterystationViewModel {
  String _historySectionTitle = "History";
  String get historySectionTitle => _historySectionTitle;
}

// void lastCharged() {
//   //TODO check which gopigo has the most recent _lastcharge
//   TimeOfDay tempo = new TimeOfDay(hour: 24, minute: 59);
//   TimeOfDay current = TimeOfDay.now();
//   int tempominutes = 0;
//   int nowminutes = current.hour * 60 + current.minute;
//   for (var i in _gopigolist) {
//     tempominutes = temppp.lastCharge.hour * 60 + temppp.lastCharge.minute;
//     print('${i._id}  $tempominutes / $nowminutes');
//     if (tempominutes - nowminutes <
//         (i.lastCharge.hour * 60 + i.lastCharge.minute) - nowminutes) {
//       //tempo.replacing(hour: i.lastCharge.hour, minute: i.lastCharge.minute);
//       temppp = i;
//     }
//   }
//   return temppp;
// }
