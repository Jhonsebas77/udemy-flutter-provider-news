import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:providers_news/src/models/news_models.dart';

const _basePathNews = 'newsapi.org';
const _apiKey = '9147785630d74507b23a50239aedbc4a';

class NewServices extends ChangeNotifier {
  List<Article> headlines = [];
  NewServices() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url = Uri.https(
      _basePathNews,
      '/v2/top-headlines',
      {
        'apiKey': _apiKey,
        'country': 'co',
      },
    );
    final response = await http.get(url);
    final newResponse = newResponseFromJson(response.body);
    headlines.addAll(newResponse.articles);
    notifyListeners();
  }
}
