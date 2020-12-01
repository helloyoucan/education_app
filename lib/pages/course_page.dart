import 'package:education_app/dao/course_list_dao.dart';
import 'package:education_app/model/course_list_model.dart';
import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/common_card.dart';
import 'package:education_app/widget/course_tag_list.dart';
import 'package:education_app/widget/page_end.dart';
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
      setState(() {
        _courseListModel = value;
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
        title: _courseNav,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(
              // top: Adapt.px(44),
              left: Adapt.px(16),
              right: Adapt.px(16),
            ),
            child: Column(
              children: [
                CourseTagList(),
                _ad,
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
          _freeCourse,
          PageEnd(),
        ],
      ),
    );
  }

  Widget get _freeCourse {
    return Padding(
      padding: EdgeInsets.only(top: Adapt.px(20)),
      child: CommonCard(
        title: '寒暑课',
        subTitle: '轻松领跑新学期',
        hasBorder: false,
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          child: Wrap(
            runSpacing: 10,
            children: [
              _freeCourseCard('assets/images/winter_vacation_course.png'),
              _freeCourseCard('assets/images/summer_courses.png')
            ],
          ),
        ),
      ),
    );
  }

  Widget _freeCourseCard(String path) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Adapt.px(5)),
      width: Adapt.px(166),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(Adapt.px(6)),
        ),
      ),
      child: Column(
        children: [
          Image.asset(path),
          Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1,
                  color: Color(0xFFEBEBEB),
                ),
                right: BorderSide(
                  width: 1,
                  color: Color(0xFFEBEBEB),
                ),
                bottom: BorderSide(
                  width: 1,
                  color: Color(0xFFEBEBEB),
                ),
                top: BorderSide(
                  width: 1,
                  color: Color(0xFFEBEBEB),
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Adapt.px(6)),
                bottomRight: Radius.circular(Adapt.px(6)),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '关注重点难点，提分更有效',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: Adapt.px(12),
                    height: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Adapt.px(9),
                    left: Adapt.px(9),
                    bottom: Adapt.px(9),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '限时免费',
                        style: TextStyle(
                          color: Color(0xFFFF5942),
                          fontSize: Adapt.px(14),
                        ),
                      ),
                      Text(
                        '7,123人已学',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: Adapt.px(12),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  /// 头部导航
  Widget get _courseNav {
    return Row(
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
    );
  }

  Widget get _ad {
    return Container(
      padding: EdgeInsets.only(bottom: Adapt.px(3), top: Adapt.px(12)),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/images/course_ad.png',
        height: Adapt.px(39),
        width: Adapt.px(343),
      ),
    );
  }

  Widget _courseCard(CourseItem item) {
    print(item.coverURL);
    return Container(
      margin: EdgeInsets.only(
        top: Adapt.px(12),
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
              Container(
                margin: EdgeInsets.only(
                  left: Adapt.px(13),
                  top: Adapt.px(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: Adapt.px(0),
                        bottom: Adapt.px(4),
                      ),
                      child: Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Adapt.px(16),
                        ),
                      ),
                    ),
                    Text(
                      item.description,
                      style: TextStyle(
                        fontSize: Adapt.px(12),
                        // fontWeight: FontWeight.bold,
                        color: Color(0xFF666666),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: Adapt.px(8),
                        bottom: Adapt.px(16),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '难度: ' + item.difficulty + '  ',
                            style: TextStyle(
                              fontSize: Adapt.px(12),
                              color: Color(0xFF999999),
                            ),
                          ),
                          _starList(item.difficultyStar),
                        ],
                      ),
                    ),
                    _tagList(item.tags),
                  ],
                ),
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
          size: Adapt.px(14),
        ),
      );
    }
    return Row(
      children: list,
    );
  }

  Widget _tagList(List<String> tags) {
    return Row(
      children: tags.map((tag) {
        return Tag(
          text: tag,
          margin: EdgeInsets.only(
            right: Adapt.px(10),
          ),
        );
      }).toList(),
    );
  }
}
