import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class PageEnd extends StatelessWidget {
  final String text;

  const PageEnd({Key key, this.text = '哎呀，到底啦~'}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      height: Adapt.px(52),
      padding: EdgeInsets.only(bottom: Adapt.px(13)),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFFD2D2D2),
          fontSize: Adapt.px(12),
        ),
      ),
    );
  }
}
