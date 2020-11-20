import 'package:flutter/material.dart';
import 'drifters_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:animations/animations.dart';

class DriftersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DriftersViewModel>.reactive(
      builder: (context, model, child) {
        print('DriftersPage / DriftersViewModel built');
        return Scaffold(
          appBar: AppBar(
            title: Text(model.title),
          ),
          body: ListView(
            children: [
              MapSection(),
              StatusSection(),
              GoHomeSection(),
            ],
          ),
        );
      },
      viewModelBuilder: () => DriftersViewModel(),
    );
  }
}

class MapSection extends StatelessWidget {
  MapSection({Key key}) : super(key: key);
//TODO make icon placements update on the map with new data from server
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        builder: (context, model, child) {
          print('MapSection built');
          return Card(
            clipBehavior: Clip.antiAlias,
            child: SizedBox(
              //TODO make this dynamic size for bigger/smaller screens
              height: model.height,
              //width: 300.0,
              child: Stack(
                children: [
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(model.map),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 32.0,
                              child: Card(
                                child: Container(
                                  child: Text(model.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    heightFactor: 5,
                    child: Icon(Icons.local_taxi),
                  ),
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => MapSectionViewModel());
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
            //height: 255, //TODO could be problem to have fixed size
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    model.statusSectionTitle,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  for (var i in model.gopigolist)
                    Column(
                      children: [
                        Divider(),
                        _gopigoListTileAnimated(context, i, model),
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

Widget _gopigoListTileAnimated(context, GoPiGo device, model) {
  print('[${device.name}] section built in _gopigoListTileAnimated');

  return OpenContainer(
    transitionType: ContainerTransitionType.fade,
    closedElevation: 0.0,
    closedBuilder: (BuildContext _, VoidCallback openContainer) {
      //if shown info amount changes, consider custom widget
      return ListTile(
        leading: Icon(
          Icons.commute, //temp icon
        ),
        title: Text(
          device.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: Container(
          //icon sizes adjusted to match material design
          width: 58, //TODO FINAL these could be problematic with scales
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
                device.batterylevel.toString() + '%',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        onTap: openContainer,
      );
    },
    openBuilder: (BuildContext _, VoidCallback openContainer) {
      final _formKey = GlobalKey<FormState>();
      return Scaffold(
        appBar: AppBar(
          title: Text('${device.name} - Settings'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                //if (_formKey.currentState.validate()) { //validate forms
                // Process data.
                model.updateSettings();
                Navigator.pop(context, true);
                //}
              },
              tooltip: 'Mark as done',
            )
          ],
        ),
        body: Card(
          child: Container(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      //key: _formKey,
                      decoration: InputDecoration(
                        helperText: 'device.name',
                        //labelText: 'Name',
                        border: OutlineInputBorder(),
                      ),
                      initialValue: device.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        //TODO make text sanitizer
                        return null;
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text("setting 2"),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {
                        value = !value;
                      },
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text('batterylevel warning'),
                    title: Slider(
                        value: 25,
                        min: 0,
                        max: 100,
                        divisions: 6,
                        label: '25',
                        onChanged: (double value) {}),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text("setting 2"),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text("setting 2"),
                    trailing: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class GoHomeSection extends StatelessWidget {
  const GoHomeSection({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) {
        print('GoHomeSectionViewModel built');
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).accentColor,
                          ),
                          onPressed: model.onPressed,
                          child: Text(model.buttonTitle,
                              style: Theme.of(context).textTheme.button),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      viewModelBuilder: () => GoHomeSectionViewModel(),
    );
  }
}
