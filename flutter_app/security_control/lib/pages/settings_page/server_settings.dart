import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'subsettings_viewmodel.dart';
import 'widgets/settings_widgets.dart';

class ServerSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubSettingsViewModel>.reactive(
        viewModelBuilder: () => SubSettingsViewModel(),
        builder: (context, model, child) =>
            Scaffold(
                appBar: AppBar(
                  title: Text(model.serverSettingsLabel),
                ),
                body: Card(
                    child:
                    ListView(
                      padding: EdgeInsets.only(top: 8),
                      children: [
                        // TODO: The following line of code is horrible change it to use viewmodel
                        menuListTile(model.serverAddressLabel, context, (){showDialog(context:context,builder: (BuildContext context) => requestTextAlertDialog(model.serverAddressDialogTitle, model.serverAddressDialogHintLabel, model.serverAddressDialogConfirmButtonLabel, model.serverAddressDialogCancelButtonLabel,
                        model.setServerAddress, model.serverAddressEditingController));}, model.serverAddress),
                        // Divider(),
                        // menuSwitchListTile("This does nothing", context, null),
                        //TODO: Re-implement these so that only necessary widgets update themselves... Something weird happens now on update.
                        Divider(),
                        menuSliderListItem(model.serverUpdateIntervalLabel, context, model.setServerUpdateInterval, model.serverUpdateInterval, model.maxServerUpdateInterval, model.minServerUpdateInterval),
                        RaisedButton(
                          child: Text('e'),
                          onPressed: (){model.setServerUpdateInterval(10);},
                        )
                      ],
                    )
                )
            )
    );
  }
}