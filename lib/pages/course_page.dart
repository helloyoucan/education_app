import 'package:education_app/dao/course_list_dao.dart';
import 'package:education_app/model/course_list_model.dart';
import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/common_card.dart';
import 'package:education_app/widget/course_tag_list.dart';
import 'package:education_app/widget/select_grade.dart';
import 'package:education_app/widget/tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  CourseListModel _courseListModel;

  @override
  void initState() {
    super.initState();
    CourseListDao.fetch().then((value) {
      print('value');
      print(value);
      _courseListModel = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Adapt.px(44),
              left: Adapt.px(16),
              right: Adapt.px(16),
            ),
            child: ListView(
              children: [
                CourseTagList(),
                Column(
                  children: _courseListModel != null
                      ? _courseListModel.list.map((item) {
                          return _courseCard(item);
                        }).toList()
                      : [],
                ),
              ],
            ),
          ),
          _courseNav(context),
        ],
      ),
    );
  }

  /// 导航
  Widget _courseNav(BuildContext context) {
    double top = MediaQuery.of(context).padding.top;
    return Container(
      color: Color(0xFF02AEFB),
      height: Adapt.px(44) + top,
      padding:
          EdgeInsets.only(top: top, left: Adapt.px(10), right: Adapt.px(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SelectGrade(),
          Text(
            '精品课',
            style: TextStyle(
              fontSize: Adapt.px(18),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Container(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '添加客服 ',
                      style: TextStyle(
                        fontSize: Adapt.px(12),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                    Text(
                      '领免费课 ',
                      style: TextStyle(
                        fontSize: Adapt.px(12),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.support_agent,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _courseCard(CourseItem item) {
    print(item.coverURL);
    return Container(
      margin: EdgeInsets.only(
        bottom: Adapt.px(12),
      ),
      child: CommonCard(
        title: item.type,
        subTitle: item.description,
        circular: 6,
        child: Container(
          padding: EdgeInsets.only(
            bottom: Adapt.px(19),
            left: Adapt.px(11),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  PhysicalModel(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    child: Image.network(
                      item.coverURL +
                          '/' +
                          Adapt.px(103).toInt().toString() +
                          '/' +
                          Adapt.px(120).toInt().toString(),
                      width: Adapt.px(103),
                      height: Adapt.px(120),
                    ),
                  ),
                  Positioned(
                    top: Adapt.px(13),
                    right: Adapt.px(13),
                    child: Text(
                      '难度' + item.difficultyStar.toString() + '星',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Adapt.px(12),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '难度: ' + item.difficulty,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _starList(item.difficultyStar),
                    ],
                  ),
                  _tagList(item.tags),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _starList(int num) {
    List<Widget> list = List();
    for (int i = 0; i < num; i++) {
      list.add(
        Icon(
          Icons.star,
          color: Color(0xFFFF632B),
        ),
      );
    }
    return Row(
      children: list,
    );
  }
}

Widget _tagList(List<String> tags) {
  return Row(
    children: tags.map((tag) {
      return Tag(text: tag);
    }).toList(),
  );
}
