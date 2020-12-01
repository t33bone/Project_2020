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
          body: ListView(
            children: [
              StatusSection(),
              HistorySection(),
            ],
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
        print('StatusSectionViewModel built');
        return Card(
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    model.statusSectionTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.commute),
                      Text(model.recentDevice.getName,
                          style: Theme.of(context).textTheme.bodyText1),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(Icons.battery_std),
                            Text('<TIMESTAMP> ',
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                    ],
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

class HistorySection extends StatelessWidget {
  HistorySection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HistorySectionViewModel>.reactive(
        builder: (context, model, child) {
          print('MapSection built');
          return Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Text(
                      model.historySectionTitle,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.commute),
                        Text('model.recentDevice.getName',
                            style: Theme.of(context).textTheme.bodyText1),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Icon(Icons.battery_std),
                              Text('<TIMESTAMP> ',
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => HistorySectionViewModel());
  }
}
