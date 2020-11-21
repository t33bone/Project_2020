import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'gallery_viewmodel.dart';
import 'package:http/http.dart' as http;

//Gallery page

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GalleryViewModel>.reactive(
      viewModelBuilder: () => GalleryViewModel(),
      //onModelReady: (model) => model.loadData(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.appBarTitle)), //'Gallery'
        body: Container(
          child: Column(
            children: [
              Card(
                child: DropdownButton<Item>(
                  isExpanded: true,
                  hint: Text(model.dropDownButtonHint),
                  iconSize: model.dropDownIconSize,
                  value: model.selectedGallery,
                  onChanged: (Item value) {
                    model.setDropDownValue(value);
                  },
                  items: model.galleries.map((Item device) {
                    return DropdownMenuItem<Item>(
                      value: device,
                      child: Row(
                        children: <Widget>[
                          device.icon,
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            device.name,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Expanded(
                child: Card(
                  child: FutureBuilder<List<Photo>>(
                    future: fetchPhotos(http.Client()),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);

                      return snapshot.hasData
                          ? PhotosList(photos: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].url); //thumbnailUrl
      },
    );
  }
}
