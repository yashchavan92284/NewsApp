import 'package:news_app/Models/categories_news_model.dart';
import 'package:news_app/Models/news_channel_headlines_model.dart';
import 'package:news_app/repository/news_repository.dart';

// class NewsViewModel {
//   final _rep = NewsRepository();

//   Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(
//       String channelName) async {
//     final response = await _rep.fetchNewsChannelHeadlinesApi(channelName);
//     return response;
//   }

//   Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
//     final response = await _rep.fetchCategoricalNewsApi(category);
//     return response;
//   }
// }
class NewsViewModel {
  final NewsRepository _repository = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi(
      String channelName) async {
    if (channelName.isEmpty) {
      throw ArgumentError('Channel name cannot be empty');
    }
    final response =
        await _repository.fetchNewsChannelHeadlinesApi(channelName);
    return response;
  }

  Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async {
    if (category.isEmpty) {
      throw ArgumentError('Category cannot be empty');
    }
    final response = await _repository.fetchCategoriesNewsApi(category);
    return response;
  }
}
