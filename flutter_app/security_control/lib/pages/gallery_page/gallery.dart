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
        appBar: AppBar(title: Text('Gallery')),
        body: Card(
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
    );
  }
}
