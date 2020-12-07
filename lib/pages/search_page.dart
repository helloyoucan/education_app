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
          width: Adapt.px(60),
          height: Adapt.px(28),
          margin: EdgeInsets.only(
            left: Adapt.px(12),
            right: Adapt.px(16),
          ),
          child: RaisedButton(
            padding: EdgeInsets.only(bottom: 1),
            elevation: 0,
            onPressed: () {
              print(_textEditingController.text);
            },
            color: Colors.white,
            // color: Color(0xFFCFF3FF),
            highlightColor: Color(0xFFCFF3FF),
            highlightElevation: 0,
            shape: StadiumBorder(),
            child: Text(
              '搜索',
              style: TextStyle(
                color: Color(0xFF02AEFB),
                fontSize: Adapt.px(14),
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
        _realTimeHotSearch,
      ],
    );
  }

  Widget get _searchHistory {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('搜索历史', canDelete: true),
        Padding(
          padding: EdgeInsets.only(
            left: Adapt.px(15),
            right: Adapt.px(5),
          ),
          child: Wrap(
            children: [
              _tag('人类科幻2000年'),
              _tag('精讲“太空漫游”四部曲'),
              _tag('国学经典'),
            ],
          ),
        ),
      ],
    );
  }

  Widget get _realTimeHotSearch {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title('实时热搜', canDelete: true),
        Padding(
          padding: EdgeInsets.only(
            left: Adapt.px(15),
            right: Adapt.px(5),
          ),
          child: Wrap(
            children: [
              _tag('四年级数学提升课', isHot: true),
              _tag('精讲“太空漫游”四部曲'),
              _tag('名著解读'),
              _tag('恐龙拯救地球'),
              _tag('恐龙拯救地球'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tag(String text, {bool isHot = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEFF4F7),
        border: Border.all(
          width: Adapt.px(1),
          color: Color(0xFFE0EAF1),
        ),
        borderRadius: BorderRadius.circular(Adapt.px(28)),
      ),
      margin: EdgeInsets.only(
        right: Adapt.px(10),
        bottom: Adapt.px(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Adapt.px(8),
        vertical: Adapt.px(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isHot
              ? Icon(
                  Icons.whatshot,
                  color: Color(0xFFFE5434),
                  size: Adapt.px(17),
                )
              : Text(''),
          Text(
            '  $text',
            style: TextStyle(
                fontSize: Adapt.px(12), color: Color(0xFF666666), height: 1),
          ),
        ],
      ),
    );
  }

  Widget _title(String text, {bool canDelete = false}) {
    return Padding(
      padding: EdgeInsets.only(
        left: Adapt.px(15),
        right: Adapt.px(15),
        top: Adapt.px(15),
        bottom: Adapt.px(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
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
    );
  }
}
