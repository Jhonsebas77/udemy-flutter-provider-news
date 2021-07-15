import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:providers_news/src/models/category_model.dart';
import 'package:providers_news/src/models/news_models.dart';

const _basePathNews = 'newsapi.org';
const _pathHeadlines = '/v2/top-headlines';
const _apiKey = '9147785630d74507b23a50239aedbc4a';

class NewServices extends ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'bussines';

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'bussines'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewServices() {
    getTopHeadlines();
    for (var element in categories) {
      categoryArticles[element.name] = [];
    }
  }

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  getTopHeadlines() async {
    final url = Uri.https(
      _basePathNews,
      _pathHeadlines,
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

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.isNotEmpty) {
      return categoryArticles[category];
    }
    final url = Uri.https(
      _basePathNews,
      _pathHeadlines,
      {
        'apiKey': _apiKey,
        'country': 'co',
        'category': category,
      },
    );
    final response = await http.get(url);
    final newResponse = newResponseFromJson(response.body);
    categoryArticles[category]?.addAll(newResponse.articles);
    notifyListeners();
  }
}
