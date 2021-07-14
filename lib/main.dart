import 'package:flutter/material.dart';
import 'package:providers_news/src/ui/theme/theme.dart';
import 'package:providers_news/src/views/views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: TabsView(),
      theme: myTheme,
    );
  }
}
