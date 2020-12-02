import 'package:education_app/dao/practise_dao.dart';
import 'package:education_app/model/practise_model.dart';
import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/course_tag_list.dart';
import 'package:education_app/widget/page_end.dart';
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
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _practiseView(context),
          _wrongQuestionView,
        ],
      ),
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
        PageEnd(),
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
                width: double.infinity,
                margin: EdgeInsets.only(top: Adapt.px(10)),
                padding: EdgeInsets.fromLTRB(
                  Adapt.px(10),
                  Adapt.px(15),
                  Adapt.px(10),
                  Adapt.px(15),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(6))),
                  border: Border.all(width: 1, color: Color(0xFFEBEBEB)),
                ),
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.section,
                          style: TextStyle(
                            fontSize: Adapt.px(14),
                            color: Color(0xFF333333),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: Adapt.px(10),
                            bottom: Adapt.px(10),
                          ),
                          child: Text(
                            item.preview,
                            style: TextStyle(
                              // height: 2,
                              fontSize: Adapt.px(14),
                              color: Color(0xFF010101),
                            ),
                          ),
                        ),
                        item.correctQuestion > 0
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        item.correctQuestion.toString(),
                                        style: TextStyle(
                                          fontSize: Adapt.px(16),
                                          color: item.correctQuestion ==
                                                  item.totalQuestion
                                              ? Color(0xFF03A359)
                                              : Color(0xFFFE4320),
                                        ),
                                      ),
                                      Text(
                                        '/' +
                                            item.totalQuestion.toString() +
                                            '  答题数/总题数',
                                        style: TextStyle(
                                          // height: 2,
                                          fontSize: Adapt.px(12),
                                          color: Color(0xFF999999),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: Adapt.px(25),
                                    width: Adapt.px(180),
                                    margin: EdgeInsets.only(top: Adapt.px(4)),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF5F9FC),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(Adapt.px(13))),
                                    ),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            item.correctQuestion ==
                                                    item.totalQuestion
                                                ? Icons.mood
                                                : Icons.mood_bad,
                                            color: Color(0xFF999999),
                                            size: Adapt.px(14),
                                          ),
                                          Text(
                                            item.correctQuestion ==
                                                    item.totalQuestion
                                                ? '可真厉害，再接再厉吧^_^'
                                                : '成绩不太好，要继续努力鸭',
                                            style: TextStyle(
                                              // height: 2,
                                              fontSize: Adapt.px(12),
                                              color: Color(0xFF999999),
                                            ),
                                          )
                                        ]),
                                  ),
                                ],
                              )
                            : Text(
                                '暂未练习',
                                style: TextStyle(
                                  fontSize: Adapt.px(12),
                                  color: Color(0xFF999999),
                                ),
                              ),
                      ],
                    ),
                    Positioned(
                      top: Adapt.px(34),
                      right: Adapt.px(8),
                      child: RaisedButton(
                        padding: EdgeInsets.all(0),
                        elevation: 0,
                        onPressed: () {},
                        color: Color(0xFFCFF3FF),
                        highlightColor: Color(0xFFCFF3FF),
                        highlightElevation: 0,
                        shape: StadiumBorder(),
                        child: Container(
                          alignment: Alignment.center,
                          width: Adapt.px(80),
                          height: Adapt.px(30),
                          child: Text(
                            item.correctQuestion == 0 ? '去练习' : '再练一次',
                            style: TextStyle(
                              color: Color(0xFF02AEFB),
                              fontSize: Adapt.px(14),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          );
  }

  Widget get _wrongQuestionView {
    return Container(
      child: ListView(
        children: [
          CourseTagList(),
          Container(
              margin: EdgeInsets.only(
                top: Adapt.px(10),
                left: Adapt.px(26),
                right: Adapt.px(26),
              ),
              padding: EdgeInsets.only(
                top: Adapt.px(20),
                left: Adapt.px(24),
                right: Adapt.px(25),
                bottom: Adapt.px(14),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(Adapt.px(6))),
                border: Border.all(width: 1, color: Color(0xFFEBEBEB)),
              ),
              child: Column(
                children: [
                  Text(
                    "在18+ (18x20-25) ÷25中，最后一步求()",
                    style: TextStyle(
                      height: 1.8,
                      letterSpacing: Adapt.px(1),
                      fontSize: Adapt.px(16),
                      color: Color(0xFF333333),
                    ),
                  ),
                  _answerOption('A', '商'),
                  _answerOption('B', '和'),
                  _answerOption('C', '积'),
                ],
              )),
        ],
      ),
    );
  }

  Widget _answerOption(String index, String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(Adapt.px(6))),
        border: Border.all(
          width: 1,
          color: Color(0xFFB5E8FF),
        ),
      ),
      child: Row(
        children: [
          Text(index),
          Container(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
