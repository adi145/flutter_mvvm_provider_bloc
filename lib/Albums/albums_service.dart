import 'dart:convert';
import 'package:mvvm_provider/Albums/albums_model.dart';
import 'package:http/http.dart' as http;

class AlbumsService {
  List<Album> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }

  Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      return parsePhotos(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
// https://jsonplaceholder.typicode.com/posts
