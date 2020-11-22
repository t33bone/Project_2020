import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'pictures_viewmodel.dart';
import 'widgets/pictures_widgets.dart';
import 'package:security_control/models/photo.dart';

//Pictures page

class PicturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PicturesViewModel>.reactive(
      viewModelBuilder: () => PicturesViewModel(),
      //onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.appBarTitle)),
        body: ListView(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      model.pictureTitle,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
/*                   Padding(
                    padding: EdgeInsets.only(right: 8.0, left: 8.0),
                    //child: Image.asset(model.testImg), 
                    child: Image.network(photos[1].url),
                  ), */

                  FutureBuilder<List<Photo>>(
                    future: model.getLatestPhoto(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? LatestPicture(photos: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),

/*                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      model.deviceName + ', ' + model.dateAndTime,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ), */
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      model.galleryTitle,
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
                          model.buttonLabel,
                          style: TextStyle(fontSize: model.buttonFontSize),
                        ),
                      ),
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
