import 'package:flutter/material.dart';
import 'package:security_control/theme.dart';

import 'package:security_control/routes.dart';

// No UI building will be done here
// Only set the routes, navigation, themes etc.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getAppTheme(context, false),
      darkTheme: getAppTheme(context, true),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) => getRoute(settings),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
