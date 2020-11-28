import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final String title;
  final String subTitle;
  final Widget titleEntry;
  final double circular;
  final bool hasBorder;
  const CommonCard(
      {Key key,
      this.child,
      this.title,
      this.subTitle,
      this.titleEntry,
      this.circular = 0,
      this.hasBorder = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.fromLTRB(
      //   Adapt.px(26),
      //   Adapt.px(7),
      //   Adapt.px(26),
      //   Adapt.px(20),
      // ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            Adapt.px(this.circular),
          ),
        ),
        color: Colors.white,
        border: Border.all(
          width: hasBorder ? 1 : 0,
          color: hasBorder ? Color(0xFFEBEBEB) : Colors.white,
        ),
      ),
      child: (Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                    Adapt.px(26),
                    Adapt.px(10),
                    Adapt.px(15),
                    Adapt.px(10),
                  ),
                  // height: Adapt.px(44),
                  child: Row(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            color: Color(0xFF333333),
                            fontSize: Adapt.px(16),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '  $subTitle',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: Adapt.px(12),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: titleEntry,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          child == null ? Container() : child
        ],
      )),
    );
  }
}
