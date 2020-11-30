import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'batterystation_viewmodel.dart';

class BatteryStationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BatterystationViewModel>.reactive(
      builder: (context, model, child) {
        print('BatterystationPage / BatterystationViewModel built');
        return Scaffold(
          appBar: AppBar(
            title: Text(model.title),
          ),
          body: Container(
            padding: EdgeInsets.all(8),
            child: StatusSection(),
          ),
        );
      },
      viewModelBuilder: () => BatterystationViewModel(),
    );
  }
}

class StatusSection extends StatelessWidget {
  StatusSection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatusSectionViewModel>.reactive(
      builder: (context, model, child) {
        model.lastCharged();
        print('StatusSectionViewModel built');
        return Card(
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  Text(
                    model.statusSectionTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  // for (var i in model.gopigolist)

                  ListTile(
                    leading: Icon(
                      Icons.commute, //temp icon
                    ),
                    title: Text(
                      model.temppp.name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    trailing: Container(
                      //icon sizes adjusted to match material design
                      width:
                          58, //TODO FINAL these could be problematic with scales
                      height: 48,
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          //TODO make charge icons dynamic to the charge %
                          Icon(
                            Icons.battery_std,
                          ),
                          Text(
                            model.temppp.batterylevel.toString() + '%',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => StatusSectionViewModel(),
    );
  }
}
