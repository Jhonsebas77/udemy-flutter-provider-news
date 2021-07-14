import 'package:flutter/material.dart';
import 'package:providers_news/src/models/news_models.dart';

class NewServices extends ChangeNotifier {
  List<Article> headlines = [];
  NewServices() {
    getTopHeadlines();
  }

  getTopHeadlines() {
    print('Loading...');
  }
}
