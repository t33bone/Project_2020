import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PicturesViewModel extends ChangeNotifier {
  String _testImg = "lib/images/test_img.png";
  String _deviceName = "testDevice123";
  String _dateAndTime = "dateAndTime123";

  String get testImg => _testImg;
  String get deviceName => _deviceName;
  String get dateAndTime => _dateAndTime;

  void goToGalleryPage(context) {
    Navigator.pushNamed(context, '/GalleryPage');
  }
}
