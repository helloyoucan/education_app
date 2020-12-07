import 'dart:ui';

import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GuidePage extends StatefulWidget {
  final VoidCallback goFn;

  const GuidePage({Key key, this.goFn}) : super(key: key);
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  int activeIndex = 0;
  Widget guideItem(
      {String title, String subTitle, String bgPath, bool isLast = false}) {
    return Column(
      children: <Widget>[
        Container(
          height: Adapt.px(361),
          color: Color(0xFFF6F7FF),
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            bgPath,
            width: Adapt.px(218),
            height: Adapt.px(300),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 62, 0, 3),
                      child: Text(
                        title,
                        strutStyle: StrutStyle(height: Adapt.px(4)),
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: Adapt.px(24),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: Adapt.px(14),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                isLast
                    ? Positioned(
                        child: Image.asset(
                          'assets/images/read_book_icon.png',
                          width: Adapt.px(44),
                          height: Adapt.px(44),
                        ),
                        bottom: Adapt.px(73),
                      )
                    : Container(height: 0.0, width: 0.0),
                isLast
                    ? Positioned(
                        child: RaisedButton(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),
                          color: Color(0xFF03AEFB),
                          onPressed: () {
                            widget.goFn();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: Adapt.px(330),
                            height: Adapt.px(50),
                            child: Text(
                              '开启学习之旅',
                              style: TextStyle(
                                fontSize: Adapt.px(18),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        bottom: Adapt.px(33),
                      )
                    : Container(height: 0.0, width: 0.0)
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = List();
    list.add(
      guideItem(
        title: '小学课程同步学',
        subTitle: '专注提升课内成绩',
        bgPath: 'assets/images/guide_bg_1.png',
      ),
    );
    list.add(
      guideItem(
        title: '实用工具伴你行',
        subTitle: '小工具在手，问题不再有',
        bgPath: 'assets/images/guide_bg_2.png',
      ),
    );
    list.add(
      guideItem(
        title: '课外学习探索未知',
        subTitle: '国学经典、名著解读、历史地理、科幻故事',
        bgPath: 'assets/images/guide_bg_3.png',
        isLast: true,
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Swiper(
          itemWidth: double.infinity,
          itemBuilder: (BuildContext context, int index) {
            return list[index];
          },
          itemCount: list.length,
          onIndexChanged: (index) {
            setState(() {
              activeIndex = index;
            });
          },
          pagination: activeIndex == list.length - 1
              ? new SwiperCustomPagination(
                  builder: (BuildContext context, SwiperPluginConfig config) {
                  return Text('');
                })
              : new SwiperPagination(
                  margin: EdgeInsets.only(bottom: 45),
                ),
          loop: false,
        ),
      ),
    );
  }
}
