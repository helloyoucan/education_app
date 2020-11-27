import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/common_card.dart';
import 'package:education_app/widget/extracurricular_study_list.dart';
import 'package:education_app/widget/home_bar.dart';
import 'package:education_app/widget/home_countdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          _listView(context),
          HomeBar(),
        ],
      ),
    );
  }

  Widget _listView(BuildContext context) {
    return ListView(
      children: <Widget>[
        Stack(children: <Widget>[
          Container(
            color: Color(0xFF02AEFB),
            height: Adapt.px(124),
            width: double.infinity,
          ),
          _synchronizedCoachingCard(context)
        ]),
        _swiperPromoteContent,
        _utilsNav,
        extracurricularStudy,
        projectActivity,
        Container(
          height: 1000,
        )
      ],
    );
  }

  /// 专题活动
  Widget get projectActivity {
    return Container(
      margin: EdgeInsets.fromLTRB(0, Adapt.px(16), 0, 0),
      child: CommonCard(
        title: '课外学习',
        subTitle: '爱探索未知的孩子最酷啦',
        titleEntry: Text(
          '全部>',
          style: TextStyle(
            fontSize: Adapt.px(12),
            color: Color(0xFF999999),
          ),
        ),
        hasBorder: false,
        child: Container(
          // margin: EdgeInsets.only(
          //   bottom: Adapt.px(15),
          //   left: Adapt.px(15),
          //   right: Adapt.px(15),
          // ),
          child: projectActivityCard(),
        ),
      ),
    );
  }

  Widget projectActivityCard() {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              Adapt.px(6),
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            PhysicalModel(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Adapt.px(6),
                ),
                topRight: Radius.circular(
                  Adapt.px(6),
                ),
              ),
              child: Image.network(
                'https://via.placeholder.com/' +
                    Adapt.px(200).toInt().toString() +
                    'x' +
                    Adapt.px(104).toInt().toString() +
                    '?text=',
                width: Adapt.px(200),
                height: Adapt.px(104),
              ),
            ),
            Container(
                // child: LimitedBox,
                ),
            Container(
              child: Row(
                children: <Widget>[
                  Text(
                    '距活动结束',
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: Adapt.px(12),
                      // fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 课外学习
  Widget get extracurricularStudy {
    return Container(
      margin: EdgeInsets.fromLTRB(0, Adapt.px(16), 0, 0),
      child: CommonCard(
        title: '专题活动',
        subTitle: '学得好，也要玩得好呦~',
        titleEntry: Text(
          '全部>',
          style: TextStyle(
            fontSize: Adapt.px(12),
            color: Color(0xFF999999),
          ),
        ),
        hasBorder: false,
        child: Container(
          // margin: EdgeInsets.only(
          //   bottom: Adapt.px(15),
          //   left: Adapt.px(15),
          //   right: Adapt.px(15),
          // ),
          child: ExtracurricularStudyList(),
        ),
      ),
    );
  }

  /// 实用工具
  Widget get _utilsNav {
    return Container(
      margin: EdgeInsets.fromLTRB(Adapt.px(16), Adapt.px(0), Adapt.px(16), 0),
      child: CommonCard(
        title: '实用工具',
        subTitle: '小工具在手，问题不再有',
        circular: 6,
        // titleEntry: Text(
        //   '全部>',
        //   style: TextStyle(
        //     fontSize: Adapt.px(12),
        //     color: Color(0xFF999999),
        //   ),
        // ),
        child: Container(
          margin: EdgeInsets.only(
            bottom: Adapt.px(15),
            left: Adapt.px(16),
            right: Adapt.px(16),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _utilsNavItem(
                    iconImageName: 'util_nav_1',
                    text: '拍照搜题',
                    isFirstColumn: true,
                  ),
                  _utilsNavItem(
                    iconImageName: 'util_nav_2',
                    text: '计算器',
                    isFirstColumn: true,
                  ),
                  _utilsNavItem(
                    iconImageName: 'util_nav_3',
                    text: '单词查询',
                    isFirstColumn: true,
                  ),
                  _utilsNavItem(
                    iconImageName: 'util_nav_4',
                    text: '语文作文',
                    isFirstColumn: true,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _utilsNavItem(
                    iconImageName: 'util_nav_5',
                    text: '古文助手',
                  ),
                  _utilsNavItem(
                    iconImageName: 'util_nav_6',
                    text: '英语作文',
                  ),
                  _utilsNavItem(
                    iconImageName: 'util_nav_7',
                    text: '汉语字典',
                  ),
                  _utilsNavItem(
                    iconImageName: 'util_nav_8',
                    text: '心算练习',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _utilsNavItem(
      {String iconImageName = '',
      String text = '',
      bool isFirstColumn = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: Adapt.px(isFirstColumn ? 22 : 0)),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/util_nav/$iconImageName.png',
            width: Adapt.px(56),
            height: Adapt.px(56),
          ),
          Container(
            margin: EdgeInsets.only(top: Adapt.px(10)),
            child: Text(
              text,
              style: TextStyle(
                fontSize: Adapt.px(12),
                color: Color(0xFF666666),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 同步辅导的卡片
  Widget _synchronizedCoachingCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Adapt.px(16),
          MediaQuery.of(context).padding.top + Adapt.px(35), Adapt.px(16), 0),
      child: CommonCard(
        title: '同步教辅',
        subTitle: '全科全面的学习工具',
        circular: 6,
        child: Container(
          padding: EdgeInsets.only(
              left: Adapt.px(26), right: Adapt.px(26), bottom: Adapt.px(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/chinese.png',
                    width: Adapt.px(79),
                    height: Adapt.px(91),
                  ),
                ),
                margin: EdgeInsets.only(top: Adapt.px(11)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFBA9BFC),
                      offset: Offset(0, 6),
                      spreadRadius: -5,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/math.png',
                    width: Adapt.px(79),
                    height: Adapt.px(91),
                  ),
                ),
                margin: EdgeInsets.only(top: Adapt.px(11)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF4DA0FF),
                      offset: Offset(0, 6),
                      spreadRadius: -5,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/english.png',
                    width: Adapt.px(79),
                    height: Adapt.px(91),
                  ),
                ),
                margin: EdgeInsets.only(top: Adapt.px(11)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFFD06B),
                      offset: Offset(0, 6),
                      spreadRadius: -5,
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 轮播图推广处
  Widget get _swiperPromoteContent {
    return Container(
      height: Adapt.px(205),
      margin: EdgeInsets.only(top: Adapt.px(17)),
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // color: Colors.blue,
              padding: EdgeInsets.fromLTRB(
                  Adapt.px(16), Adapt.px(0), Adapt.px(16), Adapt.px(38)),
              child: Container(
                height: Adapt.px(167),
                width: Adapt.px(343),
                color: Colors.white,
                child: _swiperPromoteContentItem,
              ),
            );
          },
          itemCount: 3,
          pagination: new SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
            List<Widget> list = new List();
            for (int i = 0; i < config.itemCount; i++) {
              list.add(Container(
                margin: EdgeInsets.only(
                  left: Adapt.px(2),
                  right: Adapt.px(2),
                  bottom: Adapt.px(23),
                ),
                child: Icon(
                  Icons.brightness_1,
                  size: Adapt.px(7),
                  color: i == config.activeIndex ? Colors.blue : Colors.grey,
                ),
              ));
            }
            return Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Positioned(
                  child: Row(
                    children: list.toList(),
                  ),
                  bottom: 0,
                )
              ],
            );
          })
          // pagination: new SwiperPagination(margin: EdgeInsets.all(0)),
          ),
    );
  }

  /// 轮播图推广处单个卡片
  Widget get _swiperPromoteContentItem {
    return PhysicalModel(
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(6),
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: Color(0xFFEBEBEB),
                // color: Colors.black,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                child: Image.asset(
                  "assets/images/swiper_promote.png",
                  height: Adapt.px(78),
                  width: double.infinity,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: Adapt.px(14)),
                height: Adapt.px(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: Adapt.px(68),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Adapt.px(13),
                                ),
                                border: Border.all(
                                  color: Color(0xFF414141),
                                  width: Adapt.px(1),
                                ),
                              ),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Adapt.px(13))),
                                child: Image.network(
                                  'https://via.placeholder.com/' +
                                      Adapt.px(26).toString(),
                                  width: Adapt.px(26),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: Adapt.px(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Adapt.px(13),
                                ),
                                border: Border.all(
                                  color: Color(0xFF414141),
                                  width: Adapt.px(1),
                                ),
                              ),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Adapt.px(13))),
                                child: Image.network(
                                  'https://via.placeholder.com/' +
                                      Adapt.px(26).toString(),
                                  width: Adapt.px(26),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: Adapt.px(40),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  Adapt.px(13),
                                ),
                                border: Border.all(
                                  color: Color(0xFF414141),
                                  width: Adapt.px(1),
                                ),
                              ),
                              child: PhysicalModel(
                                color: Colors.transparent,
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(Adapt.px(13))),
                                child: Image.network(
                                  'https://via.placeholder.com/' +
                                      Adapt.px(26).toString(),
                                  width: Adapt.px(26),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: Adapt.px(5),
                        right: Adapt.px(12),
                      ),
                      margin: EdgeInsets.only(
                        right: Adapt.px(8),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            width: Adapt.px(1),
                            color: Color(0xFFEFEFEF),
                          ),
                        ),
                      ),
                      child: Text(
                        '已服务超21.2万同学',
                        style: TextStyle(
                          fontSize: Adapt.px(12),
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '名额仅剩',
                        style: TextStyle(
                          fontSize: Adapt.px(14),
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    Container(
                      width: Adapt.px(32),
                      height: Adapt.px(30),
                      margin: EdgeInsets.only(
                        left: Adapt.px(3),
                        right: Adapt.px(3),
                      ),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            child: Container(
                              height: Adapt.px(13),
                              width: Adapt.px(32),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFDE40),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              height: Adapt.px(13),
                              width: Adapt.px(32),
                              decoration: BoxDecoration(
                                color: Color(0xFFFFDE40),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '30',
                              style: TextStyle(
                                fontSize: Adapt.px(20),
                                color: Color(0xFF333333),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Text(
                        '位',
                        style: TextStyle(
                          fontSize: Adapt.px(14),
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: Adapt.px(25),
                    padding: EdgeInsets.only(
                      left: Adapt.px(10),
                      right: Adapt.px(10),
                    ),
                    constraints: BoxConstraints(
                      minWidth: Adapt.px(180),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F9FC),
                      borderRadius: BorderRadius.circular(
                        Adapt.px(13),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.access_alarm,
                          size: Adapt.px(16),
                          color: Color(0xFF999999),
                        ),
                        Text(
                          '倒计时:  ',
                          style: TextStyle(
                            fontSize: Adapt.px(12),
                            color: Color(0xFF999999),
                          ),
                        ),
                        HomeCountdown()
                      ],
                    ),
                  ),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
