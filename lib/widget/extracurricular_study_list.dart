import 'package:education_app/dao/ExtracurricularStudyDao.dart';
import 'package:education_app/model/extracurricular_study_model.dart';
import 'package:education_app/util/adapt_util.dart';
import 'package:education_app/widget/tag.dart';
import 'package:flutter/material.dart';

class ExtracurricularStudyList extends StatefulWidget {
  @override
  _ExtracurricularStudyListState createState() =>
      _ExtracurricularStudyListState();
}

class _ExtracurricularStudyListState extends State<ExtracurricularStudyList> {
  String currentGategory = '科幻故事';
  ExtracurricularStudyModel extracurricularStudyModel;

  @override
  void initState() {
    super.initState();
    ExtracurricularStudyDao.fetch().then((value) {
      print('extracurricularStudyModel');
      print(value);
      setState(() {
        extracurricularStudyModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Adapt.px(15),
        right: Adapt.px(15),
      ),
      child: Column(
        children: <Widget>[
          _gategoryList,
          _bookList(),
          Container(
            alignment: Alignment.center,
            height: Adapt.px(50),
            child: Text(
              '探索全部科幻故事 >',
              style: TextStyle(
                color: Color(0xFF03AEFB),
                fontSize: Adapt.px(14),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _bookList() {
    return Column(
      children: extracurricularStudyModel != null
          ? extracurricularStudyModel.list.map((e) {
              return _bookItem(e);
            }).toList()
          : [],
    );
  }

  Widget _bookItem(ExtracurricularStudyModelItem item) {
    return Container(
      padding: EdgeInsets.only(
        top: Adapt.px(10),
        bottom: Adapt.px(10),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFFEFEFEF)),
        ),
      ),
      child: Row(
        children: <Widget>[
          PhysicalModel(
            color: Colors.transparent,
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(Adapt.px(6)),
            child: Image.network(
              'http://placekitten.com/' +
                  Adapt.px(100).toInt().toString() +
                  '/' +
                  Adapt.px(120).toInt().toString() +
                  '?text=' +
                  item.bookName,
              width: Adapt.px(100),
              height: Adapt.px(120),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: Adapt.px(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: Adapt.px(16)),
                  child: Row(
                    children: <Widget>[
                      item.isNew
                          ? Container(
                              alignment: AlignmentDirectional.center,
                              margin: EdgeInsets.only(right: Adapt.px(6)),
                              width: Adapt.px(40),
                              height: Adapt.px(17),
                              decoration: BoxDecoration(
                                color: Color(0xFFFF5942),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Adapt.px(8)),
                                  bottomRight: Radius.circular(Adapt.px(8)),
                                ),
                              ),
                              child: Text(
                                '最新',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Adapt.px(12),
                                ),
                              ),
                            )
                          : Container(),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.bookName,
                          style: TextStyle(
                            fontSize: Adapt.px(16),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: Adapt.px(5), bottom: Adapt.px(5)),
                  child: Text(
                    item.description,
                    style: TextStyle(
                      fontSize: Adapt.px(12),
                      color: Color(0xFF999999),
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      height: Adapt.px(24),
                      child: Text(
                        '￥',
                        style: TextStyle(
                          fontSize: Adapt.px(12),
                          color: Color(0xFFFF5942),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      item.discountPrice,
                      style: TextStyle(
                        fontSize: Adapt.px(24),
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFF5942),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Adapt.px(5)),
                      alignment: Alignment.bottomLeft,
                      height: Adapt.px(24),
                      child: Text(
                        '￥' + item.price,
                        style: TextStyle(
                          fontSize: Adapt.px(12),
                          color: Color(0xFFC7C7C7),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Color(0xFFC7C7C7),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height: Adapt.px(25),
                  padding: EdgeInsets.only(
                    left: Adapt.px(10),
                    right: Adapt.px(10),
                  ),
                  margin: EdgeInsets.only(top: Adapt.px(5)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F9FC),
                    borderRadius: BorderRadius.circular(
                      Adapt.px(13),
                    ),
                  ),
                  child: Text(
                    item.readCount + '人已学',
                    style: TextStyle(
                        fontSize: Adapt.px(12),
                        color: Color(0xFF999999),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _gategoryList {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _gategoryListItem('科幻故事'),
          _gategoryListItem('国学经典'),
          _gategoryListItem('名著解读'),
          _gategoryListItem('历史地理'),
        ],
      ),
    );
  }

  Widget _gategoryListItem(gategoryText) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentGategory = gategoryText;
        });
      },
      child: Tag(
        text: gategoryText,
        isActive: currentGategory == gategoryText,
        margin: EdgeInsets.fromLTRB(0, 0, 0, Adapt.px(10)),
      ),
    );
  }
}
