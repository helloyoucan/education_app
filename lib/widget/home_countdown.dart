import 'dart:async';

import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class CountdownType {
  static const String normal = 'normal';
  static const String simple = 'simple';
}

class HomeCountdown extends StatefulWidget {
  final String type;

  const HomeCountdown({Key key, this.type = CountdownType.normal})
      : super(key: key);
  @override
  _HomeCountdownState createState() => _HomeCountdownState();
}

class _HomeCountdownState extends State<HomeCountdown>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Timer _timer;
  double countdown = 7 * 24 * 60 * 60 * 1000.00;
  final aDay = 24 * 60 * 60 * 1000;
  final aHour = 60 * 60 * 1000;
  final aMin = 60 * 1000;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        countdown -= 1000;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int day = countdown ~/ aDay;
    double surplusCountdown = countdown - day * aDay;
    int hour = surplusCountdown ~/ aHour;
    surplusCountdown = surplusCountdown - hour * aHour;
    int min = surplusCountdown ~/ aMin;
    surplusCountdown = surplusCountdown - min * aMin;
    int second = surplusCountdown ~/ 1000;
    if (widget.type == CountdownType.simple) {
      return Container(
        child: Row(
          children: <Widget>[
            _blockItem(hour.toString()),
            Text(
              ' : ',
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: Adapt.px(12),
              ),
            ),
            _blockItem(min.toString()),
            Text(
              ' : ',
              style: TextStyle(
                color: Color(0xFF666666),
                fontSize: Adapt.px(12),
              ),
            ),
            _blockItem(second.toString()),
            // Text(
            //   '$day 天 $hour 时 $min 分 $second 秒',
            //   style: TextStyle(
            //       fontSize: Adapt.px(12),
            //       color: Color(0xFF999999),
            //       backgroundColor: Colors.amber),
            // )
          ],
        ),
      );
    }
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            '$day 天 $hour 时 $min 分 $second 秒',
            style: TextStyle(
              fontSize: Adapt.px(12),
              color: Color(0xFF999999),
            ),
          )
        ],
      ),
    );
  }

  _blockItem(String text) {
    return Container(
      alignment: Alignment.center,
      width: Adapt.px(19),
      height: Adapt.px(19),
      color: Color(0xFFEFEFEF),
      child: Text(
        text,
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: Adapt.px(12),
        ),
      ),
    );
  }
}
