import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/services/news_service.dart';
import 'package:providers_news/src/ui/theme/theme.dart';
import 'package:providers_news/src/views/views.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NewServices(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: const TabsView(),
        theme: myTheme,
      ),
    );
  }
}
