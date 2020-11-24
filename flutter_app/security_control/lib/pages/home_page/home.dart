import 'package:flutter/material.dart';
import 'package:security_control/pages/home_page/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

// First screen after login (if login required)
// Should have a sidebar available on the left for navigation

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          // TO BE REPLACED BY UNIVERSAL APPBAR
          title: Text('Security Control'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(model.accountName),
                accountEmail: Text(model.accountEmail),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  /* Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white, */
                  child: Text(
                    model.accountName[0],
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.devices.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: model.devices[i].icon,
                      title: Text(model.devices[i].name),
                      onTap: () {
                        Navigator.of(context).pop();
                        model.drawerItemOnPressed(i);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
/*           child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(model.accountName),
                accountEmail: Text(model.accountEmail),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  /* Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white, */
                  child: Text(
                    model.accountName[0],
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: Icon(Icons.directions_car_rounded),
                title: Text('Drifters'),
                onTap: () => model.driftersButtonOnPressed(),
              ),
              ListTile(
                leading: Icon(Icons.airplanemode_active_rounded),
                title: Text('Drone'),
                onTap: () =>
                    model.selectDestination(0), //model.droneButtonOnPressed(),
              ),
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text('Sensors'),
                onTap: () => model
                    .selectDestination(0), //model.sensorsButtonOnPressed(),
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('Pictures'),
                onTap: () => model.picturesButtonOnPressed(),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => model.settingsButtonOnPressed(),
              ),
            ],
          ),
        ), */

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // PLACEHOLDER BUTTON
            TextButton(
              onPressed: () {
                model.driftersButtonOnPressed();
              },
              child: Text('Drifters'),
            ),

            // PLACEHOLDER BUTTON
            TextButton(
              onPressed: () {
                model.picturesButtonOnPressed();
              },
              child: Text('Pictures'),
            ),

            // PLACEHOLDER BUTTON
            TextButton(
              onPressed: () {
                model.settingsButtonOnPressed();
              },
              child: Text('Settings'),
            )
          ],
        ),
      ),
    );
  }
}
