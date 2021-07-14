import 'package:flutter/material.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
