import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:security_control/models/gopigo.dart';

class TestGopigo {
  int _id;
  String _name;
  int _batterylevel;
  TimeOfDay _lastCharge;

  TestGopigo(this._id, this._name, this._batterylevel, this._lastCharge);

  int get id => _id;
  String get name => _name;
  int get batterylevel => _batterylevel;
  TimeOfDay get lastCharge => _lastCharge;

  void setId(int i) => _id = i;
  void setName(String newName) => _name = newName;
  void setBatteryLevel(int i) => _batterylevel = i;
}

class BatterystationViewModel extends BaseViewModel {
  String _title = "Batterystation<temp>"; //TODO FINAL: replace temp title
  String get title => _title;
  //TODO generate gopigolist from server
  final _gopigolist = <TestGopigo>[
    TestGopigo(1, 'test car1', 23, TimeOfDay(hour: 1, minute: 00)),
    TestGopigo(2, 'BoB', 46, TimeOfDay(hour: 12, minute: 24)),
    TestGopigo(3, 'gopigo5', 100, TimeOfDay(hour: 7, minute: 29))
  ];
}

class StatusSectionViewModel extends BatterystationViewModel {
  String _statusSectionTitle = "Charge Section Here";
  String get statusSectionTitle => _statusSectionTitle;
  //TODO timeofday needs back to the future treatment, also need date info
  TestGopigo temppp =
      TestGopigo(13, 'test car1', 123, TimeOfDay(hour: 2, minute: 01));

  TestGopigo lastCharged() {
    //TODO check which gopigo has the most recent _lastcharge
    TimeOfDay tempo = new TimeOfDay(hour: 24, minute: 59);
    TimeOfDay current = TimeOfDay.now();
    int tempominutes = 0;
    int nowminutes = current.hour * 60 + current.minute;
    for (var i in _gopigolist) {
      tempominutes = temppp.lastCharge.hour * 60 + temppp.lastCharge.minute;
      print('${i._id}  $tempominutes / $nowminutes');
      if (tempominutes - nowminutes <
          (i.lastCharge.hour * 60 + i.lastCharge.minute) - nowminutes) {
        //tempo.replacing(hour: i.lastCharge.hour, minute: i.lastCharge.minute);
        temppp = i;
      }
    }
    return temppp;
  }
}
