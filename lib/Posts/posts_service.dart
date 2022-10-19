import 'dart:convert';
import 'package:mvvm_provider/Posts/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsService {
  List<Posts> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Posts>((json) => Posts.fromJson(json)).toList();
  }

  Future<List<Posts>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      return parsePhotos(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
