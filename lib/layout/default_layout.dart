import 'package:flutter/material.dart';
import 'package:beginners219/screens/article_screen.dart';
import 'package:beginners219/screens/home_screen.dart';
import 'package:beginners219/screens/search_screen.dart';
import 'package:beginners219/screens/setting_screen.dart';

class DefaultLayout extends StatefulWidget {
  const DefaultLayout({Key? key}) : super(key: key);

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    SearchScreen(),
    ArticleScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/white_logo.png',
          height: 40.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Icon(
            Icons.notifications,
            color: Color.fromRGBO(33, 3, 248, 0.5),
          ),
          SizedBox(
            width: 10.0,
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color.fromRGBO(33, 3, 248, 0.3),
            ),
            activeIcon: Icon(
              Icons.home,
              color: Color.fromRGBO(33, 3, 248, 1),
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Color.fromRGBO(33, 3, 248, 0.3),
            ),
            activeIcon: Icon(
              Icons.search,
              color: Color.fromRGBO(33, 3, 248, 1),
            ),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.article,
              color: Color.fromRGBO(33, 3, 248, 0.3),
            ),
            activeIcon: Icon(
              Icons.article,
              color: Color.fromRGBO(33, 3, 248, 1),
            ),
            label: '아티클',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Color.fromRGBO(33, 3, 248, 0.3),
            ),
            activeIcon: Icon(
              Icons.settings,
              color: Color.fromRGBO(33, 3, 248, 1),
            ),
            label: '설정',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(33, 3, 248, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
