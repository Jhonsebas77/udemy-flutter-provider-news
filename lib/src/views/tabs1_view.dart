import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/services/news_service.dart';
import 'package:providers_news/src/widgets/widgets.dart';

class Tab1View extends StatelessWidget {
  const Tab1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewServices>(context).headlines;
    return (headlines.isEmpty)
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListNews(
            headlines,
          );
  }
}
