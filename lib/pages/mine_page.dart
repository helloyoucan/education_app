import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _accountInfo(context),
          _commonEntry,
          _entryList,
        ],
      ),
    );
  }

  Widget _accountInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Color(0xFF02AEFB),
      height: Adapt.px(176),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: Adapt.px(7),
            right: Adapt.px(18),
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: Icon(Icons.edit),
              iconSize: Adapt.px(18),
            ),
          ),
          Positioned(
            top: Adapt.px(21),
            left: Adapt.px(30),
            child: Row(
              children: [
                Container(
                  height: Adapt.px(60),
                  padding: EdgeInsets.all(Adapt.px(1)),
                  margin: EdgeInsets.only(right: Adapt.px(5)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Adapt.px(31)),
                  ),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(Adapt.px(30)),
                    child: Image.network(
                      'http://placekitten.com/' +
                          Adapt.px(59).toInt().toString() +
                          '/' +
                          Adapt.px(59).toInt().toString(),
                      width: Adapt.px(59),
                      height: Adapt.px(59),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '不爱擦身子的生姜  ',
                          style: TextStyle(
                            fontSize: Adapt.px(18),
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.home,
                          size: Adapt.px(18),
                          color: Colors.white,
                        )
                      ],
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        '别做吃瓜群众啦，快想个响亮的个性签名吧',
                        style: TextStyle(
                          fontSize: Adapt.px(12),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: Adapt.px(91),
            left: Adapt.px(87),
            child: Container(
              width: Adapt.px(230),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Adapt.px(3), horizontal: Adapt.px(5)),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD898),
                          borderRadius: BorderRadius.circular(Adapt.px(31)),
                        ),
                        child: Text(
                          '新生入学',
                          style: TextStyle(
                            fontSize: Adapt.px(8),
                            color: Color(0xFF35333A),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: Adapt.px(3), horizontal: Adapt.px(5)),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFD898),
                          borderRadius: BorderRadius.circular(Adapt.px(31)),
                        ),
                        child: Text(
                          '好学分子',
                          style: TextStyle(
                            fontSize: Adapt.px(8),
                            color: Color(0xFF35333A),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: Adapt.px(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lv.1',
                          style: TextStyle(
                            fontSize: Adapt.px(14),
                            color: Colors.white,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              width: Adapt.px(150),
                              height: Adapt.px(4),
                              decoration: BoxDecoration(
                                color: Color(0x2DFFFFFF),
                                borderRadius:
                                    BorderRadius.circular(Adapt.px(4)),
                              ),
                            ),
                            Container(
                              width: Adapt.px(150 * 0.45),
                              height: Adapt.px(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(Adapt.px(4)),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Lv.2',
                          style: TextStyle(
                            fontSize: Adapt.px(14),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      opacity: 0.62,
                      child: Text(
                        '再学习45分钟即可升级Lv.2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Adapt.px(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget get _commonEntry {
    return Container(
      height: Adapt.px(115),
      decoration: BoxDecoration(
        color: Color(0xFF02AEFB),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Adapt.px(6)),
            topRight: Radius.circular(Adapt.px(6)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.pages,
                    size: Adapt.px(28),
                    color: Color(0xFFBEA0FE),
                  ),
                ),
                Text(
                  "我的订单",
                  style: TextStyle(
                    fontSize: Adapt.px(14),
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "查看购课订单",
                  style: TextStyle(
                    fontSize: Adapt.px(12),
                    color: Color(0xFF999999),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.pages,
                    size: Adapt.px(28),
                    color: Color(0xFFBEA0FE),
                  ),
                ),
                Text(
                  "我的收藏",
                  style: TextStyle(
                    fontSize: Adapt.px(14),
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "收藏的题都在这呦",
                  style: TextStyle(
                    fontSize: Adapt.px(12),
                    color: Color(0xFF999999),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Icon(
                    Icons.pages,
                    size: Adapt.px(28),
                    color: Color(0xFFBEA0FE),
                  ),
                ),
                Text(
                  "我的活动",
                  style: TextStyle(
                    fontSize: Adapt.px(14),
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "我参与的专题活动",
                  style: TextStyle(
                    fontSize: Adapt.px(12),
                    color: Color(0xFF999999),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _entryList {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: Adapt.px(10)),
      padding: EdgeInsets.only(left: Adapt.px(16), right: Adapt.px(16)),
      child: Column(
        children: [
          entryItem(
            icon: Icons.home,
            iconColor: Color(0xFF02C2FF),
            title: '消息中心',
          ),
          entryItem(
            icon: Icons.home,
            iconColor: Color(0xFF02C2FF),
            title: '设置',
          ),
          entryItem(
            icon: Icons.home,
            iconColor: Color(0xFF02C2FF),
            title: '客服小姐姐',
          ),
          entryItem(
            icon: Icons.home,
            iconColor: Color(0xFF02C2FF),
            title: '赏个好评',
            subTitle: '卖萌求鼓励^_^',
          ),
          entryItem(
            icon: Icons.home,
            iconColor: Color(0xFF02C2FF),
            title: '消息中心',
          ),
        ],
      ),
    );
  }

  Widget entryItem(
      {IconData icon, Color iconColor, String title, String subTitle = ''}) {
    return Container(
      height: Adapt.px(50),
      child: Row(
        children: [
          Icon(icon, size: 21, color: iconColor),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: Adapt.px(14),
            ),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: Color(0xFFC7C7C7),
                      fontSize: Adapt.px(12),
                    ),
                  ),
                  Icon(
                    Icons.rotate_right,
                    color: Color(0xFFBABABA),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
