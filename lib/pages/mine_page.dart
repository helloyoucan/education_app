import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/page_end.dart';
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
          PageEnd(),
        ],
      ),
    );
  }

  Widget _accountInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Color(0xFF02AEFB),
      height: Adapt.px(166),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: Adapt.px(7),
            right: Adapt.px(18),
            child: IconButton(
              onPressed: () {},
              color: Colors.white,
              icon: Icon(Icons.border_color),
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
      decoration: BoxDecoration(
        color: Color(0xFF02AEFB),
      ),
      child: PhysicalModel(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Adapt.px(6)),
          topRight: Radius.circular(Adapt.px(6)),
        ),
        child: Container(
          height: Adapt.px(115),
          color: Colors.white,
          child: GridView.count(
            crossAxisCount: 3,
            children: [
              _commonEntryItem(
                icon: Icons.description,
                iconColor: Color(0xFFBEA0FE),
                text: "我的订单",
                description: "查看购课订单",
              ),
              _commonEntryItem(
                icon: Icons.turned_in,
                iconColor: Color(0xFFFF632B),
                text: "我的收藏",
                description: "收藏的题都在这呦",
              ),
              _commonEntryItem(
                icon: Icons.assistant_photo,
                iconColor: Color(0xFF06C76E),
                text: "我的活动",
                description: "我参与的专题活动",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonEntryItem({
    IconData icon,
    Color iconColor,
    String text,
    String description,
  }) {
    return OutlineButton(
      onPressed: () {},
      padding: EdgeInsets.all(0),
      borderSide: BorderSide(color: Colors.transparent),
      highlightedBorderColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Column(
        children: [
          Container(
            child: Icon(
              icon,
              size: Adapt.px(28),
              color: iconColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Adapt.px(12),
              bottom: Adapt.px(4),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: Adapt.px(14),
                color: Color(0xFF666666),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontSize: Adapt.px(12),
              color: Color(0xFF999999),
            ),
          )
        ],
      ),
    );
  }

  Widget get _entryList {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: Adapt.px(10)),
      child: Column(
        children: [
          entryItem(
            icon: Icons.notifications,
            iconColor: Color(0xFF02C2FF),
            title: '消息中心',
          ),
          entryItem(
            icon: Icons.settings,
            iconColor: Color(0xFFBEA0FE),
            title: '设置',
          ),
          entryItem(
            icon: Icons.person,
            iconColor: Color(0xFFFEBC30),
            title: '客服小姐姐',
          ),
          entryItem(
            icon: Icons.thumb_up,
            iconColor: Color(0xFFFF632B),
            title: '赏个好评',
            subTitle: '卖萌求鼓励^_^',
          ),
          entryItem(
              icon: Icons.info,
              iconColor: Color(0xFF4CA0FE),
              title: '探索小学通',
              isLast: true),
        ],
      ),
    );
  }

  Widget entryItem(
      {IconData icon,
      Color iconColor,
      String title,
      String subTitle = '',
      bool isLast = false}) {
    return OutlineButton(
      onPressed: () {},
      padding: EdgeInsets.all(0),
      borderSide: BorderSide(color: Colors.transparent),
      highlightedBorderColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: Container(
        height: Adapt.px(50),
        padding: EdgeInsets.only(left: Adapt.px(16), right: Adapt.px(16)),
        decoration: BoxDecoration(
          border: Border(
            bottom: isLast
                ? BorderSide.none
                : BorderSide(width: Adapt.px(1), color: Color(0x33C7C7C7)),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: Adapt.px(21), color: iconColor),
            Text(
              '  $title',
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
                      Icons.keyboard_arrow_right,
                      size: Adapt.px(24),
                      color: Color(0xFFBABABA),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
