import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:security_control/models/gopigo.dart';
import 'widgets/CreationAwareListItem.dart';
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
          body: Column(children: [
            StatusSection(),
            Expanded(child: HistorySection()),
          ]),
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
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.commute),
                            Text(model.recentDevice.name,
                                style: Theme.of(context).textTheme.bodyText2),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 14.0),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(Icons.lock_clock),
                            // Text(
                            //     timeFormat
                            //         .format(model.recentDevice.getTimestamp),
                            //     style: Theme.of(context).textTheme.bodyText2),
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
          print('HistorySection built');
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                Text(
                  model.historySectionTitle,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.center,
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: model.items.length,
                    itemBuilder: (context, index) => CreationAwareListItem(
                      itemCreated: () {
                        print('item created $index');
                        SchedulerBinding.instance.addPostFrameCallback(
                            (duration) =>
                                model.handleHistoryItemCreated(index));
                      },
                      child: HistoryItem(
                        device: model.items[index],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        viewModelBuilder: () => HistorySectionViewModel());
  }
}

class HistoryItem extends StatelessWidget {
  final GoPiGo device;
  const HistoryItem({Key key, this.device}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: device.id == -5
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                    Icon(Icons.car_rental),
                    Text(device.name),
                  ]),
                  Row(children: [
                    Icon(Icons.timer),
                    // Text(timeFormat.format(device.getTimestamp)),
                  ]),
                ],
              ),
        alignment: Alignment.center,
      ),
    );
  }
}
