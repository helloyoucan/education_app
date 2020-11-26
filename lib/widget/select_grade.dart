import 'package:education_app/util/adapt_util.dart';
import 'package:flutter/material.dart';

class SelectGrade extends StatefulWidget {
  @override
  _SelectGradeState createState() => _SelectGradeState();
}

class _SelectGradeState extends State<SelectGrade> {
  String currentSelect = '四年级';
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.fromLTRB(
      //   Adapt.px(20),
      //   MediaQuery.of(context).padding.top + Adapt.px(10),
      //   Adapt.px(20),
      //   Adapt.px(40),
      // ),
      child: GestureDetector(
        onTap: () {
          _showSelectGradeDialog(context);
        },
        child: Row(
          children: <Widget>[
            // PhysicalModel(
            //   color: Colors.transparent,
            //   borderRadius: BorderRadius.circular(Adapt.px(14)),
            //   clipBehavior: Clip.antiAlias,
            //   child:
            Container(
              height: Adapt.px(28),
              padding: EdgeInsets.fromLTRB(1, 1, Adapt.px(5), 1),
              decoration: BoxDecoration(
                color: Color(0xFF69CFFD),
                borderRadius: BorderRadius.circular(Adapt.px(14)),
              ),
              child: Row(
                children: <Widget>[
                  // PhysicalModel(),
                  Container(
                    // margin: EdgeInsets.all(1),
                    child: PhysicalModel(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(Adapt.px(13)),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/head_icon.png',
                        width: Adapt.px(26),
                        height: Adapt.px(26),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(Adapt.px(3), 0, 0, 0),
                    child: Text(
                      currentSelect,
                      style: TextStyle(
                        fontSize: Adapt.px(12),
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: Adapt.px(14),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }

  _showSelectGradeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Dialog(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: Adapt.px(208),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topRight,
                      padding:
                          EdgeInsets.fromLTRB(0, Adapt.px(10), Adapt.px(5), 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: Adapt.px(24),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(
                          0, Adapt.px(5), Adapt.px(8), Adapt.px(15)),
                      child: Text(
                        '选择你所在的年级',
                        style: TextStyle(
                          fontSize: Adapt.px(16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _gradeItem('一年级', setState),
                            _gradeItem('二年级', setState)
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _gradeItem('三年级', setState),
                            _gradeItem('四年级', setState)
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            _gradeItem('五年级', setState),
                            _gradeItem('六年级', setState)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _gradeItem(String gradeText, StateSetter _setState) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentSelect = gradeText;
        });
        _setState(() {
          currentSelect = gradeText;
        });
        Navigator.of(context).pop();
      },
      child: Container(
        margin:
            EdgeInsets.fromLTRB(Adapt.px(13), 0, Adapt.px(13), Adapt.px(13)),
        decoration: BoxDecoration(
          color: currentSelect == gradeText ? Colors.blue : Colors.white,
          border: Border.all(
              color: currentSelect == gradeText ? Colors.blue : Colors.grey,
              width: 1),
          borderRadius: BorderRadius.all(Radius.circular(Adapt.px(14))),
        ),
        height: Adapt.px(26),
        width: Adapt.px(72),
        alignment: Alignment.center,
        child: Text(
          gradeText,
          style: TextStyle(
            fontSize: Adapt.px(12),
            fontWeight: currentSelect == gradeText
                ? FontWeight.bold
                : FontWeight.normal,
            color: currentSelect == gradeText ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
