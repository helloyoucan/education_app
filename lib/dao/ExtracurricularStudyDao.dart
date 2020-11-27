// import 'dart:async';

// const HOME_URL = 'https://www.devio.org/io/flutter_app/json/home_page.json';

import 'dart:convert';

import 'package:education_app/model/extracurricular_study_model.dart';

class ExtracurricularStudyDao {
  /*static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);

    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Fail to load home_page.json');
    }
  }*/
  static Future<ExtracurricularStudyModel> fetch() async {
    String jsonStr =
        '{"list":[{"isNew":true,"bookName":"人类科幻200年","description":"跟我一起探索人类想象力的极限吧","price":"9.9","discountPrice":"199","readCount":"92123"},{"isNew":false,"bookName":"一本正经的外星人课","description":"科学的星际交流指南","price":"19.9","discountPrice":"269","readCount":"67343"},{"isNew":false,"bookName":"精讲“太空漫游”四部曲","description":"科学的星际交流指南","price":"12.9","discountPrice":"139","readCount":"67343"},{"isNew":false,"bookName":"自然界的奥秘","description":"自然界太多未知的东西吸引着我们去探索","price":"39.9","discountPrice":"339","readCount":"67343"},{"isNew":false,"bookName":"恐龙拯救地球","description":"你知道吗，恐龙竟然要拯救地球？","price":"12.9","discountPrice":"139","readCount":"67343"}]}';
    var result = json.decode(jsonStr);
    return ExtracurricularStudyModel.fromJson(result);
  }
}
