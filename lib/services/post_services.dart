import 'dart:convert';
import 'package:http/http.dart' as http;

class PostService {
  final String apiUrl;

  PostService({required this.apiUrl});

  Future<List<dynamic>> fetchPosts(int pageKey) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?_page=$pageKey'));

      if (response.statusCode == 200) {
        final List<dynamic> newItems = json.decode(response.body);
        return newItems;
      } else {
        throw Exception('Failed to load post data');
      }
    } catch (error) {
      rethrow;
    }
  }
}
