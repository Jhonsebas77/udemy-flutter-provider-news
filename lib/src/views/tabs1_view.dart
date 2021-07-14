import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/services/news_service.dart';
import 'package:providers_news/src/widgets/widgets.dart';

class Tab1View extends StatefulWidget {
  const Tab1View({Key? key}) : super(key: key);

  @override
  State<Tab1View> createState() => _Tab1ViewState();
}

class _Tab1ViewState extends State<Tab1View>
    with AutomaticKeepAliveClientMixin {
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

  @override
  bool get wantKeepAlive => true;
}
