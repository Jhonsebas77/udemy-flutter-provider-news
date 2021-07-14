import 'package:flutter/material.dart';
import 'package:providers_news/src/models/news_models.dart';
import 'package:providers_news/src/ui/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  // ignore: use_key_in_widget_constructors
  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (_, int index) {
        return News(
          news: news[index],
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
    return Column(
      children: [
        _BuildTopCard(
          news: news,
          index: index,
        ),
        _CardTitle(
          news: news,
          index: index,
        ),
        _CardImage(
          news: news,
          index: index,
        ),
        _CardInfo(
          news: news,
          index: index,
        ),
        const _CardButton(),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
      ],
    );
  }
}

class _BuildTopCard extends StatelessWidget {
  final Article news;
  final int index;
  const _BuildTopCard({
    Key? key,
    required this.news,
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
      child: Row(
        children: [
          Text(
            '${index + 1}. ',
            style: TextStyle(
              color: myTheme.errorColor,
            ),
          ),
          Text(
            '${news.source.name}. ',
          ),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article news;
  final int index;
  const _CardTitle({
    Key? key,
    required this.news,
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
        '${news.title}. ',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Article news;
  final int index;
  const _CardImage({
    Key? key,
    required this.news,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(60),
        bottomRight: Radius.circular(60),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        child: (news.urlToImage != null)
            ? FadeInImage(
                placeholder: const AssetImage(
                  'assets/img/giphy.gif',
                ),
                image: NetworkImage(
                  news.urlToImage,
                ),
              )
            : const Image(
                image: AssetImage(
                  'assets/img/giphy.gif',
                ),
              ),
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  final Article news;
  final int index;
  const _CardInfo({
    Key? key,
    required this.news,
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
        '${news.description}. ',
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}

class _CardButton extends StatelessWidget {
  const _CardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.errorColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
