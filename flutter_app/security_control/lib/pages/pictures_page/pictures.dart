import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'pictures_viewmodel.dart';

//Pictures page

class PicturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PicturesViewModel>.reactive(
      viewModelBuilder: () => PicturesViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('Pictures')),
        body: ListView(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Latest Picture',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Image.asset(model.testImg),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      model.deviceName + ', ' + model.dateAndTime,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Gallery',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          model.galleryButtonOnPressed();
                        },
                        icon: Icon(Icons.airplanemode_active_rounded),
                        label: Text(
                          'Picture Gallery',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
/*                     ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.directions_car_rounded),
                      label: Text(
                        'GoPiGo',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ), */
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
