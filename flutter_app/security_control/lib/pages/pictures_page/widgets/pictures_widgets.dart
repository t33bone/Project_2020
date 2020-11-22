import 'package:flutter/material.dart';
import 'package:security_control/models/photo.dart';

class LatestPicture extends StatelessWidget {
  final List<Photo> photos;
  LatestPicture({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0, left: 8.0),
          child: Image.network(photos[0].url),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'photos.deviceName, photos.dateAndTime',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
