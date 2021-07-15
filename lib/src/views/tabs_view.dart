import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/views/tabs1_view.dart';
import 'package:providers_news/src/views/tabs2_view.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Titulares de Colombia',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: const _BuildPages(),
        bottomNavigationBar: const _BuildNavigation(),
      ),
    );
  }
}

class _BuildNavigation extends StatelessWidget {
  const _BuildNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.actualPage,
      onTap: (i) => navigationModel.actualPage = i,
      selectedItemColor: Colors.lightBlue,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Para ti',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Titulares',
        ),
      ],
    );
  }
}

class _BuildPages extends StatelessWidget {
  const _BuildPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: navigationModel.pageController,
      children: const [
        Tab1View(),
        Tab2Pages(),
      ],
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _actualPage = 0;
  final PageController _pageController = PageController();

  int get actualPage => _actualPage;
  set actualPage(int value) {
    _actualPage = value;
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
