import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F9FC),
      appBar: AppBar(
        leadingWidth: Adapt.px(43),
        leading: IconButton(
          iconSize: Adapt.px(30),
          icon: Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFF02AEFB),
        title: _searchBar,
      ),
      body: _searchResult,
    );
  }

  Widget get _searchBar {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: Adapt.px(28),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Adapt.px(28)),
              color: Color(0x55FFFFFF),
            ),
            child: Row(
              children: [
                Container(
                  width: Adapt.px(34),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Adapt.px(18),
                  ),
                ),
                Expanded(
                    child: TextField(
                  controller: _textEditingController,
                  autofocus: true,
                  style: TextStyle(
                    height: 1,
                    fontSize: Adapt.px(12),
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    fillColor: Colors.brown,
                    // filled: true,
                    contentPadding: EdgeInsets.only(
                      top: Adapt.px(8),
                      bottom: Adapt.px(8),
                    ),
                    isCollapsed: true,
                    hintText: '四年级学霸养成营课程',
                    hintStyle: TextStyle(
                      color: Color(0x88FFFFFF),
                      fontSize: Adapt.px(12),
                    ),
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  textInputAction: TextInputAction.search,
                )),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: Adapt.px(12),
            right: Adapt.px(16),
          ),
          child: RaisedButton(
            padding: EdgeInsets.all(0),
            elevation: 0,
            onPressed: () {
              print(_textEditingController.text);
            },
            color: Color(0xFFCFF3FF),
            highlightColor: Color(0xFFCFF3FF),
            highlightElevation: 0,
            shape: StadiumBorder(),
            child: Container(
              alignment: Alignment.center,
              // width: Adapt.px(60),
              height: Adapt.px(30),
              child: Text(
                '搜索',
                style: TextStyle(
                  color: Color(0xFF02AEFB),
                  fontSize: Adapt.px(14),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget get _searchResult {
    return Column(
      children: [
        _searchHistory,
      ],
    );
  }

  Widget get _searchHistory {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(Adapt.px(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '搜索历史',
                style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: Adapt.px(14),
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.delete_forever,
                  size: Adapt.px(20),
                  color: Color(0xFFD6D6D6),
                ),
              )
            ],
          ),
        ),
        Wrap(
          children: [
            _tag('人类科幻2000年'),
            _tag('精讲“太空漫游”四部曲'),
            _tag('国学经典'),
            _tag('国学经典'),
          ],
        )
      ],
    );
  }

  Widget _tag(String text, {bool isHot}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
        border: Border.all(
          width: Adapt.px(1),
          color: Color(0xFFE0EAF1),
        ),
        borderRadius: BorderRadius.circular(Adapt.px(14)),
      ),
      margin: EdgeInsets.only(
        right: Adapt.px(10),
        bottom: Adapt.px(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Adapt.px(8),
        vertical: Adapt.px(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: Adapt.px(12), color: Color(0xFF666666), height: 1),
          ),
        ],
      ),
    );
  }
}
