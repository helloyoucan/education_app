import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/home_bar.dart';
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
        Container(
          height: 1000,
        )
      ],
    );
  }

  // 同步辅导的卡片
  Widget _synchronizedCoachingCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(Adapt.px(16),
          MediaQuery.of(context).padding.top + Adapt.px(35), Adapt.px(16), 0),
      // width: Adapt.px(343),
      // height: Adapt.px(155),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(
              Adapt.px(26), Adapt.px(7), Adapt.px(26), Adapt.px(19)),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '同步教辅',
                    style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: Adapt.px(16),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: Adapt.px(6)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '全科全面的学习工具',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: Adapt.px(12),
                      ),
                    ),
                  )
                ],
              ),
              Row(
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
            ],
          ),
        ),
      ),
    );
  }

  // 轮播图推广处
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    PhysicalModel(
                      color: Colors.transparent,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6)),
                      child: Image.asset(
                        "assets/images/swiper_promote.png",
                        height: Adapt.px(78),
                        width: double.infinity,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // height: Adapt.px(89),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                    // child: Stack(
                                    //   children: <Widget>[],
                                    // ),
                                    ),
                                Container(
                                  child: Text('已服务超21.2万同学'),
                                ),
                                Container(
                                  child: Text('名额仅剩'),
                                ),
                                Container(
                                    // child: Stack(
                                    //   children: <Widget>[],
                                    // ),
                                    ),
                                Container(
                                  child: Text('位'),
                                ),
                              ],
                            ),
                            Container()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
}
