import 'package:flutter/material.dart';
import 'package:security_control/models/photo.dart';

class PhotosList extends StatelessWidget {
  final List<Photo> photos;
  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
/*     return GridView.builder(
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
    ); */
    return ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return Card(
              child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.network(photos[index].url),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  'photos[index].deviceName, photos[index].dateAndTime',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              )
            ],
          ));
        });
  }
}
