import 'package:education_app/util/adapt_util.dart';
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
      child: Text('我的'),
      height: Adapt.px(156),
      width: double.infinity,
    );
  }
}
