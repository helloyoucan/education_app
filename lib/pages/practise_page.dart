import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/course_tag_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> bookList = ['人教版  数学  四年级', '人教版  数学  四年级', '人教版  数学  四年级'];

class PractisePage extends StatefulWidget {
  @override
  _PractisePageState createState() => _PractisePageState();
}

class _PractisePageState extends State<PractisePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int activeIndex = 0;
  String selectBook = bookList[0];
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F9FC),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF02AEFB),
        title: TabBar(
          controller: _tabController,
          isScrollable: true, // 是否可以滚动
          indicatorWeight: 0.1,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.all(0),
          onTap: (index) {
            setState(() {
              activeIndex = index;
            });
          },
          tabs: <Widget>[
            _tab('练习', 0, isFirst: true),
            _tab('错题', 1, isLast: true),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: <Widget>[
        _practiseView(context),
        Text('选项卡2'),
      ]),
    );
  }

  Widget _tab(String text, int index,
      {bool isFirst = false, bool isLast = false}) {
    BorderRadiusGeometry radius = BorderRadius.only();
    if (isFirst) {
      radius = BorderRadius.only(
        topLeft: Radius.circular(Adapt.px(4)),
        bottomLeft: Radius.circular(Adapt.px(4)),
      );
    }
    if (isLast) {
      radius = BorderRadius.only(
        topRight: Radius.circular(Adapt.px(4)),
        bottomRight: Radius.circular(Adapt.px(4)),
      );
    }
    return Tab(
      child: Container(
        alignment: Alignment.center,
        height: Adapt.px(28),
        width: Adapt.px(60),
        decoration: BoxDecoration(
          color: activeIndex == index ? Colors.white : Colors.transparent,
          border: Border.all(width: Adapt.px(1), color: Colors.white),
          borderRadius: radius,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: Adapt.px(14),
            fontWeight: FontWeight.normal,
            color: activeIndex == index ? Color(0xFF02AEFB) : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _practiseView(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(
            left: Adapt.px(16),
            right: Adapt.px(16),
          ),
          child: Column(
            children: [
              CourseTagList(),
              _selectBook(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _selectBook(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return Container(
                height: (MediaQuery.of(context).size.height) / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Adapt.px(6)),
                    topRight: Radius.circular(Adapt.px(6)),
                  ),
                ),
                child: ListView(
                  children: [
                    Card(
                      child: ListTile(
                        title: Text('One-line with both widgets'),
                        trailing: Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        height: Adapt.px(33),
        margin: EdgeInsets.only(top: Adapt.px(10)),
        padding: EdgeInsets.only(
          left: Adapt.px(14),
          right: Adapt.px(14),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFD7EFFF),
          borderRadius: BorderRadius.all(Radius.circular(Adapt.px(6))),
        ),
        child: Row(
          children: [
            Text(
              '当前版本:  ' + selectBook,
              style: TextStyle(
                fontSize: Adapt.px(12),
                color: Color(0xFF8AA8B6),
              ),
            ),
            Icon(
              Icons.expand_more,
              color: Color(0xFF8AA8B6),
              size: Adapt.px(12),
            ),
          ],
        ),
      ),
    );
  }
}
