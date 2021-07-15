import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/services/news_service.dart';

class Tab2Pages extends StatelessWidget {
  const Tab2Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            Expanded(
              child: ListCategories(),
            ),
          ],
        ),
      ),
    );
  }
}

class ListCategories extends StatelessWidget {
  const ListCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewServices>(context).categories;
    return ListView.builder(
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, int index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Icon(categories[index].icon),
              const SizedBox(height: 5),
              Text(categories[index].name),
            ],
          ),
        );
      },
    );
  }
}
