import 'package:flutter/material.dart';
import 'package:security_control/pages/home_page/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/cupertino.dart';

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
          title: Text(model.appBarTitle),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(model.accountName),
                accountEmail: Text(model.accountEmail),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    model.accountName[0],
                    style: TextStyle(fontSize: model.avatarFontSize),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.drawerItems.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        ListTileTheme(
                          iconColor: Colors.grey,
                          child: ListTile(
                            leading: model.drawerItems[i].icon,
                            title: Text(model.drawerItems[i].name),
                            onTap: () {
                              Navigator.of(context).pop();
                              model.drawerItemOnPressed(i);
                            },
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(model.serverConnectionLabel,
                          style: Theme.of(context).textTheme.headline6),
                      trailing: model.serverConnected == true
                          ? Text(
                              model.serverOnline,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: model.labelFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              model.serverOffline,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: model.labelFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    ListTile(
                      title: Text(model.securityStatusLabel,
                          style: Theme.of(context).textTheme.headline6),
                      trailing: model.intruderAlert == false
                          ? Text(
                              model.noIntruders,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: model.labelFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              model.intruders,
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: model.labelFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    ListTile(
                      leading: model.intruderAlert == true
                          ? Icon(Icons.info,
                              color: Theme.of(context).accentColor)
                          : Icon(Icons.check_circle),
                      title: model.intruderAlert == true
                          ? Text(model.actionsRequired.length.toString() +
                              model.actionRequiredLabel)
                          : Text(model.noActionRequiredLabel),
                      onTap: () => model.intruderAlert == true
                          ? model.showRequiredActionsDialog(context)
                          : null,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.devicesList.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        leading: Container(
                          //icon sizes adjusted to match material design
                          width: 58,
                          height: 48,
                          // width: MediaQuery.of(context).size.width * 0.15,
                          // height: MediaQuery.of(context).size.height * 0.70,
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Icon(
                                Icons.battery_std,
                              ),
                              Text(
                                model.devicesList[i].batterylevel.toString() +
                                    '%',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                        title: Text(
                          model.devicesList[i].name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: model.devicesList[i].connected == true
                            ? Text(
                                model.deviceConnected,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                model.deviceDisconnected,
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold),
                              ),
                        //onTap: () {}, //on tap goto device page/ device settings?
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
