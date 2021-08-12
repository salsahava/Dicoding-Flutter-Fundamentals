import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/article_list_page.dart';
import 'package:news_app/settings_page.dart';
import 'package:news_app/widgets/platform_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomNavIndex = 0;

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: bottomNavIndex == 0 ? ArticleListPage() : SettingsPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text('Headline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: (selected) {
          setState(() {
            bottomNavIndex = selected;
          });
        },
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            title: Text('Headline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return ArticleListPage();
          case 1:
            return SettingsPage();
          default:
            return ArticleListPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
