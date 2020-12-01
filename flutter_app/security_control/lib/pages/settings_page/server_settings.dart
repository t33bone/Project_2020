import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'subsettings_viewmodel.dart';
import 'widgets/settings_widgets.dart';

class ServerSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SubSettingsViewModel>.reactive(
        onModelReady: (model) => model.initialise(),
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
                        serverAddressTileAnimated(context, model),
                        // Divider(),
                        // menuSwitchListTile("This does nothing", context, null),
                        //TODO: Re-implement these so that only necessary widgets update themselves... Something weird happens now on update.
                        Divider(),
                        //TODO: Preferences are still updated while sliding, maybe the widget is rebuilding?
                        menuSliderListItem(model.serverUpdateIntervalLabel, context, model.setServerUpdateInterval,
                            model.serverUpdateInterval, model.maxServerUpdateInterval, model.minServerUpdateInterval,
                            model.saveServerUpdateInterval()),
                        // RaisedButton(
                        //   child: Text(model.serverAddress),
                        //   onPressed: (){model.setServerUpdateInterval(10);},
                        // )
                        Row(
                          children: [
                            //Text(model.goPiGo.id),
                            Text(model.goPiGo.battery.toString()),
                            Text(model.goPiGo.location.toString())
                          ],
                        )
                      ],
                    )
                )
            )
    );
  }
}

Widget serverAddressTileAnimated(context, model){
  return ListTile(title: Text(model.serverAddressLabel),
      onTap: (){
        showDialog(context:context,
          builder: (BuildContext context) => requestTextAlertDialog(context,model.serverAddressDialogTitle, model.serverAddressDialogHintLabel,
            model.serverAddressDialogConfirmButtonLabel, model.serverAddressDialogCancelButtonLabel,
            model.setServerAddress, model.serverAddressEditingController));
        },
     subtitle: Text(model.serverAddress)
  );


  // showModal(context: context, configuration: const FadeScaleTransitionConfiguration(),
  // useRootNavigator: true,
  // builder: (context){
  //   return requestTextAlertDialog(model.serverAddressDialogTitle, model.serverAddressDialogHintLabel, model.serverAddressDialogConfirmButtonLabel, model.serverAddressDialogCancelButtonLabel,
  //       model.setServerAddress, model.serverAddressEditingController);
  // });

}