import 'dart:developer';

import 'package:fetchdemo2/model/album_response_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<AlbumResponseModel>> fetchData() async {
    List<AlbumResponseModel> albums = [];
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    try {
      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          albums = albumModelFromJson(response.body);
        }
      }
    } catch (e) {
      log('error $e');
    }
    return albums;
  }
}
