import 'package:flutter/material.dart';
import 'package:security_control/models/measurement_limits.dart';

//TODO: conform to servers model of RuuviTag
class RuuviTag {
  int id;
  String name;
  double batterylevel;
  double temperature;
  double humidity;
  double pressure;

  MeasurementLimits measurementLimits;

  bool _connected = true; //TODO delete? no use/info from database

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
  void setTemperatureLimit(double k) => temperature = k;
  void setHumidityLimit(double j) => humidity = j;
  void setPressureLimit(double l) => pressure = l;
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
      temperature: json['temperature'] as double,
      humidity: json['humidity'] as double,
      pressure: json['pressure'] as double,
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
