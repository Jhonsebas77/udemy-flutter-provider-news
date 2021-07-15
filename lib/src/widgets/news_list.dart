import 'package:flutter/material.dart';
import 'package:providers_news/src/models/news_models.dart';
import 'package:providers_news/src/ui/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article>? news;
  // ignore: use_key_in_widget_constructors
  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news!.length,
      itemBuilder: (_, int index) {
        return News(
          news: news![index],
          index: index,
        );
      },
    );
  }
}

class News extends StatelessWidget {
  final Article news;
  final int index;
  const News({
    Key? key,
    required this.news,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${index + 1}. ',
              style: TextStyle(
                color: myTheme.secondaryHeaderColor,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _BuildSourceNews(
                    sourceNews: news.source.name,
                    index: index,
                  ),
                  _BuildTitleNews(
                    titleNews: news.title,
                  ),
                  _BuildImageNews(
                    photoUrlNews: news.urlToImage,
                    descriptionNews: news.description,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildSourceNews extends StatelessWidget {
  final String sourceNews;
  final int index;
  const _BuildSourceNews({
    Key? key,
    required this.sourceNews,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Text(
        sourceNews,
      ),
    );
  }
}

class _BuildTitleNews extends StatelessWidget {
  final String titleNews;

  const _BuildTitleNews({
    Key? key,
    required this.titleNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Text(
        titleNews,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}

class _BuildImageNews extends StatelessWidget {
  final String photoUrlNews;
  final String descriptionNews;
  const _BuildImageNews({
    Key? key,
    required this.photoUrlNews,
    required this.descriptionNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BoxDecoration buildDecorationGradient() {
      const colorGradientGray = LinearGradient(
        colors: [
          Colors.transparent,
          Colors.black45,
          Colors.black45,
          Colors.black45,
          Colors.black45,
          Colors.black45,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
      return const BoxDecoration(
        gradient: colorGradientGray,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Stack(
        children: [
          (photoUrlNews.isNotEmpty)
              ? FadeInImage(
                  placeholder: const AssetImage(
                    'assets/images/giphy.gif',
                  ),
                  image: NetworkImage(
                    photoUrlNews,
                  ),
                  fit: BoxFit.cover,
                  height: 180,
                  width: 380,
                )
              : const Image(
                  image: AssetImage(
                    'assets/images/no-image.png',
                  ),
                  fit: BoxFit.cover,
                  height: 180,
                  width: 380,
                ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              decoration: buildDecorationGradient(),
              child: _BuildDescriptionNews(
                descriptionNews: descriptionNews,
              ),
              height: 35,
              width: 330,
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildDescriptionNews extends StatelessWidget {
  final String descriptionNews;
  const _BuildDescriptionNews({
    Key? key,
    required this.descriptionNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Text(
        descriptionNews,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}
