// import 'dart:async';

import 'dart:convert';

import 'package:education_app/model/practise_model.dart';

class PractiseDao {
  static Future<PractiseModel> fetch() async {
    String jsonStr =
        '{"list":[{"section":"第1单元","preview":"一、四则运算","totalQuestion":12,"correctQuestion":0},{"section":"第2单元","preview":"一、观察物体（二）","totalQuestion":12,"correctQuestion":12},{"section":"第3单元","preview":"一、运算定律","totalQuestion":12,"correctQuestion":4},{"section":"第4单元","preview":"一、小数的意义和性质","totalQuestion":12,"correctQuestion":4}]}';
    var result = json.decode(jsonStr);
    return PractiseModel.fromJson(result);
  }
}
