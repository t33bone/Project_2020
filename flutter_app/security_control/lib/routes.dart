import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:security_control/pages/drifters_page/drifters.dart';
import 'package:security_control/pages/drone_page/drone.dart';
import 'package:security_control/pages/home_page/home.dart';
import 'package:security_control/pages/login_page/login.dart';
import 'package:security_control/pages/pictures_page/pictures.dart';
import 'package:security_control/pages/sensors_page/sensors.dart';
import 'package:security_control/pages/settings_page/settings.dart';
import 'package:security_control/pages/gallery_page/gallery.dart';

Route getRoute(RouteSettings settings) {
  // Add your routes here
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/HomePage':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/DriftersPage':
      return MaterialPageRoute(builder: (context) => DriftersPage());
    case '/PicturesPage':
      return MaterialPageRoute(builder: (context) => PicturesPage());
    case '/GalleryPage':
      return MaterialPageRoute(builder: (context) => GalleryPage());
    case '/SettingsPage':
      return MaterialPageRoute(builder: (context) => SettingsPage());
  }
}
