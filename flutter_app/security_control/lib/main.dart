import 'package:flutter/material.dart'
    hide
        Router; //Need to hide Router to avoid conflict with our generated router...
import 'package:security_control/router.gr.dart';
import 'package:security_control/services/navigation_service.dart';
import 'package:security_control/theme.dart';

import 'package:security_control/services/service_locator.dart';

// No UI building will be done here
// Only set the routes, navigation, themes etc.

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      iconColor: Colors.grey,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getAppTheme(context, false),
        darkTheme: getAppTheme(context, true),
        navigatorKey: locator<NavigationService>().navigatorKey,
        initialRoute: Routes.loginPage,
        //onGenerateRoute: (RouteSettings settings) => getRoute(settings),
        onGenerateRoute: Router().onGenerateRoute,
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
