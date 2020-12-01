import 'package:flutter/material.dart';

//TODO: conform to servers model of RuuviTag
class RuuviTag {
  int id;
  String name;
  double batterylevel;
  double temperature;
  double humidity;
  double pressure;

  bool _connected = true; //TODO delete? no use/info from database

  //simple tester constructor
  // RuuviTag(this._id, this.this.thisName, this._batterylevel);
  //getters
  String get getName => name;
  int get getId => id;
  double get getBatterylevel => batterylevel;
  double get getTemperature => temperature;
  double get getHumidity => humidity;
  double get getPressure => pressure;
  //setters
  void setId(int i) => id = i;
  //TODO there is no batterylevel warning in DB?
  void setBatteryLevel(double i) => batterylevel = i;
  void setName(String newthisName) {
    this.name = newthisName;
  }

  //constructor
  RuuviTag({
    this.id,
    this.name,
    this.batterylevel,
    this.temperature,
    this.humidity,
    this.pressure,
  });
  //TODO match up json field thisNames to what database gives out
  factory RuuviTag.fromJson(Map<String, dynamic> json) {
    return RuuviTag(
      id: json['id'] as int,
      name: json['DeviceName'] as String,
      batterylevel: json['title'] as double,
      temperature: json['url'] as double,
      humidity: json['thumbnailUrl'] as double,
      pressure: json['title'] as double,
    );
  }

  //TODO underwork pls ignore
  String status() {
    return _connected ? 'connected' : 'disconnected';
  }

  TextStyle statusStyle(context) {
    return _connected
        ? Theme.of(context)
            .textTheme
            .caption //TODO find correct theme to make this orange text
        : Theme.of(context).textTheme.button;
  }
}
