import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GalleryViewModel extends ChangeNotifier {
  String _appBarTitle = "Gallery";
  String _dropDownButtonHint = '  Select a device';
  static Item _selectedGallery;
  double _dropDownIconSize = 30.0;

  String get appBarTitle => _appBarTitle;
  String get dropDownButtonHint => _dropDownButtonHint;
  double get dropDownIconSize => _dropDownIconSize;

  List<Item> galleries = <Item>[
    const Item('Drone', Icon(Icons.airplanemode_active_rounded)),
    const Item('GoPiGo', Icon(Icons.directions_car_rounded)),
  ];

  void setDropDownValue(Item selected) {
    _selectedGallery = selected;
    notifyListeners();
  }

  Item get selectedGallery => _selectedGallery;
/*   static String getUrl(_selectedGallery) {
    String getPicturesUrl = "";
    _selectedGallery != null
        ? _selectedGallery.name == 'Drone'
            ? getPicturesUrl = 'https://jsonplaceholder.typicode.com/photos'
            : getPicturesUrl = null
        : null;
    return getPicturesUrl;
  } */
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/photos');
  /* await client
          .get(GalleryViewModel.getUrl(GalleryViewModel._selectedGallery)); */
  return parsePhotos(response.body);
  //return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
