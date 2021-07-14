import 'package:flutter/material.dart';
import 'package:providers_news/src/models/news_models.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  // ignore: use_key_in_widget_constructors
  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (_, int index) {
        return Text(news[index].title);
      },
    );
  }
}
