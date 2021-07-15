import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/models/category_model.dart';
import 'package:providers_news/src/services/news_service.dart';
import 'package:providers_news/src/utils/utils.dart';

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
          child: CategoryItem(
            category: categories[index],
          ),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  Widget _buildCategoryButton(BuildContext context) {
    final newServices = Provider.of<NewServices>(
      context,
    );
    return GestureDetector(
      onTap: () {
        final newServices = Provider.of<NewServices>(
          context,
          listen: false,
        );
        newServices.selectedCategory = category.name;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(
          category.icon,
          color: (newServices.selectedCategory == category.name)
              ? Colors.red
              : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategoryButton(context),
        const SizedBox(height: 5),
        Text(
          toCapitalize(category.name),
        ),
      ],
    );
  }
}
