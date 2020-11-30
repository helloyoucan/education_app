import 'package:education_app/pages/course_page.dart';
import 'package:education_app/pages/home_page.dart';
import 'package:education_app/util/iconFont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigator createState() => _TabNavigator();
}

class _TabNavigator extends State<TabNavigator> {
  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          CoursePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 26,
        unselectedFontSize: 18,
        selectedFontSize: 18,
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem('小学通',
              IconData(IconFont.academic_cap, fontFamily: 'iconfont'), 0),
          _bottomItem(
              '精品课', IconData(IconFont.book, fontFamily: 'iconfont'), 1),
          _bottomItem(
              '练习', IconData(IconFont.football, fontFamily: 'iconfont'), 2),
          _bottomItem(
              '我的', IconData(IconFont.smile, fontFamily: 'iconfont'), 3),
        ],
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.grey),
      activeIcon: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Container(
        height: 25,
        alignment: Alignment.bottomCenter,
        child: Text(
          title,
          style: TextStyle(
              height: 0,
              color: _currentIndex != index ? Colors.grey : Colors.blue),
        ),
      ),
    );
  }
}
