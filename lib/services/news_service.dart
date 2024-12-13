import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String? apiKey = dotenv.env['API_KEY'];

  Future<List<dynamic>> fetchNews(String category) async {
    final url = "https://finnhub.io/api/v1/news?category=$category&token=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load news");
    }
  }
}
