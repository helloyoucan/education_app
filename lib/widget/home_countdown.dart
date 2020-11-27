import 'dart:async';

import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class HomeCountdown extends StatefulWidget {
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
}
