import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:security_control/models/photo.dart';

class PictureService {
  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/photos');
    return parsePhotos(response.body);
    //return compute(parsePhotos, response.body);
  }

  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
