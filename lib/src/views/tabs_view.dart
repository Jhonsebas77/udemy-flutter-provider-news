import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_news/src/views/tabs1_view.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: const Scaffold(
        body: _BuildPages(),
        bottomNavigationBar: _BuildNavigation(),
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
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'For You',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          label: 'Popular',
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
      children: [
        const Tab1View(),
        Container(
          color: Colors.green,
        )
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
