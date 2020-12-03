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
        ],
      ),
    );
  }

  Widget _accountInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      color: Color(0xFF02AEFB),
      height: Adapt.px(156),
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
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: Adapt.px(230),
                    child: Row(
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
                            '新生入学',
                            style: TextStyle(
                              fontSize: Adapt.px(8),
                              color: Color(0xFF35333A),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
