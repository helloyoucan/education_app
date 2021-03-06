import 'package:education_app/pages/search_page.dart';
import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/util/navigator_util.dart';
import 'package:education_app/widget/select_grade.dart';
import 'package:flutter/material.dart';

class HomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SelectGrade(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              NavigatorUtil.push(context, SearchPage());
            },
            child: Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(left: Adapt.px(14)),
              padding: EdgeInsets.fromLTRB(Adapt.px(4), 0, Adapt.px(4), 0),
              height: Adapt.px(28),
              decoration: BoxDecoration(
                color: Color(0x9C69CFFD),
                borderRadius: BorderRadius.circular(
                  Adapt.px(14),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Adapt.px(24),
                  ),
                  Expanded(
                    child: Text(
                      '四年级学霸养成营课程',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Adapt.px(12),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: Adapt.px(24),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
