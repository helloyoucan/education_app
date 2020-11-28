import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String text;
  final bool isActive;
  final EdgeInsetsGeometry margin;

  const Tag({Key key, this.text = '', this.margin, this.isActive = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.white,
        border:
            Border.all(color: isActive ? Colors.blue : Colors.grey, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(Adapt.px(14))),
      ),
      height: Adapt.px(26),
      width: Adapt.px(72),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: Adapt.px(12),
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
