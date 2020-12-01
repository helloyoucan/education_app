import 'package:education_app/dao/practise_dao.dart';
import 'package:education_app/model/practise_model.dart';
import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/course_tag_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> bookList = ['人教版  数学  四年级', '人教版  语文  四年级', '人教版  英语  四年级'];

class PractisePage extends StatefulWidget {
  @override
  _PractisePageState createState() => _PractisePageState();
}

class _PractisePageState extends State<PractisePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int activeIndex = 0;
  String selectBook = bookList[0];
  PractiseModel _practiseModel;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    PractiseDao.fetch().then((value) {
      setState(() {
        _practiseModel = value;
      });
    });
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
              _bookListWidget,
            ],
          ),
        ),
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
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter _setState) {
                  return Container(
                    padding: EdgeInsets.all(Adapt.px(10)),
                    height: (MediaQuery.of(context).size.height) / 2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Adapt.px(6)),
                        topRight: Radius.circular(Adapt.px(6)),
                      ),
                    ),
                    child: ListView(
                      children: bookList.map((String item) {
                        return RadioListTile(
                          value: item,
                          onChanged: (value) {
                            _setState(() {
                              selectBook = value;
                            });
                            setState(() {
                              selectBook = value;
                            });
                            Navigator.of(context).pop();
                          },
                          groupValue: selectBook,
                          title: Text(item),
                          // selected: selectBook == item,
                        );
                      }).toList(),
                    ),
                  );
                },
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

  Widget get _bookListWidget {
    return _practiseModel == null
        ? Container()
        : Column(
            children: _practiseModel.list.map((item) {
              return Container(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text(item.section),
                        Text(item.preview),
                        item.correctQuestion > 0
                            ? Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(item.correctQuestion.toString()),
                                      Text('/' +
                                          item.totalQuestion.toString() +
                                          '  答题数/总题数'),
                                    ],
                                  ),
                                  item.correctQuestion == item.totalQuestion
                                      ? Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.home),
                                              Text('可真厉害，再接再厉吧^_^')
                                            ],
                                          ),
                                        )
                                      : Container(
                                          child: Row(
                                            children: [
                                              Icon(Icons.home),
                                              Text('成绩不太好，要继续努力鸭')
                                            ],
                                          ),
                                        ),
                                ],
                              )
                            : Text('暂未练习'),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          );
  }
}
