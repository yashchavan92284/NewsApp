import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/categories_news_model.dart';
import 'package:news_app/Models/news_channel_headlines_model.dart';

class NewsRepository {
  static const String _apiKey = 'b1313fa5bdcc46cf99deb8f0409ccc9b';

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    if (channelName.isEmpty) {
      throw ArgumentError('Channel name cannot be empty');
    }
    String url =
        'https://newsapi.org/v2/top-headlines?sources=$channelName&apiKey=$_apiKey';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print('Fetching news from: $url');
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Failed to load news');
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    if (category.isEmpty) {
      throw ArgumentError('Category cannot be empty');
    }
    String url =
        'https://newsapi.org/v2/everything?q=$category&apiKey=$_apiKey';

    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print('Fetching news from: $url');
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Failed to load news');
  }
}
