//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stacked/stacked.dart';
//import 'package:animations/animations.dart';

///hyviä packageja
/// auto_route:
/// stacked_services:
///
/// build_runner:
///  auto_route_generator:
///
///  #incersion of control
///  get_it:
///  injectable:
/// hyviä packageja
///  auto_route:
/// stacked_services:
///
/// build_runner:
/// auto_route_generator:
///
/// #incersion of control
///get_it:
/// injectable:

//oamk lat/long
// static const LatLng _center = const LatLng(65.059029, 25.466243);

//mitkä tarvii state infoa?
//-markerit
// -> map state?
//-gopigo settings

//TODO: conform to servers model of GoPiGo
class GoPiGo {
  String _name;
  int _batterylevel;
  Marker position;
  GoPiGo(this._name, this._batterylevel, this.position);
  void setPosition(Marker positionMark) {
    this.position = positionMark;
  }

  String get name => _name;
  int get batterylevel => _batterylevel;
  set batterylevel(int) => _batterylevel;
}

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
  String _statusSectionTitle = "'GoPiGo Section Here";
  String get statusSectionTitle => _statusSectionTitle;
  final _gopigolist = <GoPiGo>[
    GoPiGo(
      'test car1',
      23,
      Marker(
        point: LatLng(65.060803, 25.469838),
        builder: (ctx) => new Container(
          child: Icon(Icons.local_taxi),
        ),
      ),
    ),
    GoPiGo(
      'BoB',
      46,
      Marker(
        point: LatLng(65.061405, 25.464516),
        builder: (ctx) => new Container(
          child: Icon(Icons.local_taxi),
        ),
      ),
    ),
    GoPiGo(
      'gopigo5',
      100,
      Marker(
        point: LatLng(65.059292, 25.467799),
        builder: (ctx) => new Container(
          child: Icon(Icons.local_taxi),
        ),
      ),
    )
  ];
  List<GoPiGo> get gopigolist => _gopigolist;
  double _animationHeight = 48.0;
  get animationHeight => _animationHeight;

  get duration => _duration;
  void updateDrifterBatterySetting(GoPiGo device, int newValue) {
    device.batterylevel = newValue;
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
