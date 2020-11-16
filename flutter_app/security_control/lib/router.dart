import 'package:auto_route/auto_route_annotations.dart';
import 'package:security_control/pages/drifters_page/drifters.dart';
import 'package:security_control/pages/drone_page/drone.dart';
import 'package:security_control/pages/gallery_page/gallery.dart';
import 'package:security_control/pages/home_page/home.dart';
import 'package:security_control/pages/login_page/login.dart';
import 'package:security_control/pages/pictures_page/pictures.dart';
import 'package:security_control/pages/sensors_page/sensors.dart';
import 'package:security_control/pages/settings_page/settings.dart';

// I think we can add things here and re-generate the routes by using:
//  $ flutter packages pub run build_runner build
// from Terminal

// Didn't try yet tho

@MaterialAutoRouter(routes:[
  MaterialRoute(page: LoginPage, initial: true),
  MaterialRoute(page: DriftersPage, initial: false),
  MaterialRoute(page: DronePage, initial: false),
  MaterialRoute(page: GalleryPage, initial: false),
  MaterialRoute(page: HomePage, initial: false),
  MaterialRoute(page: PicturesPage, initial: false),
  MaterialRoute(page: SensorsPage, initial: false),
  MaterialRoute(page: SettingsPage, initial: false),
])
class $Router{}
