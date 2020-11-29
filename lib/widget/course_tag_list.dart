import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/tag.dart';
import 'package:flutter/material.dart';

class CourseTagList extends StatefulWidget {
  @override
  _CourseTagListState createState() => _CourseTagListState();
}

class _CourseTagListState extends State<CourseTagList> {
  String currentTag = '数学';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          _TagItem('语文'),
          _TagItem('数学'),
          _TagItem('外语'),
        ],
      ),
    );
  }

  Widget _TagItem(tagText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentTag = tagText;
        });
      },
      child: Tag(
        text: tagText,
        margin: EdgeInsets.only(
          top: Adapt.px(10),
          right: Adapt.px(10),
        ),
        isActive: tagText == currentTag,
      ),
    );
  }
}
