// import 'dart:async';

import 'dart:convert';

import 'package:education_app/model/course_list_model.dart';

class CourseListDao {
  static Future<CourseListModel> fetch() async {
    String jsonStr =
        '{"list":[{"type":"提升课","description":"适合成绩70-90分的同学","coverURL":"http://placekitten.com","name":"四年级数学提升课","subTitle":"名师主讲+辅导老师，打牢数学基础","difficulty":"中等","difficultyStar":3,"tags":["吃透课本","夯实基础"]},{"type":"尖子课","description":"适合成绩90分以上的同学","coverURL":"http://placekitten.com","name":"四年级数学尖子课","subTitle":"名师主讲+辅导老师，打牢数学基础","difficulty":"较难","difficultyStar":3,"tags":["突破难点","方法延伸"]},{"type":"冲顶课","description":"适合成绩95分以上的同学","coverURL":"http://placekitten.com","name":"四年级数学冲顶课","subTitle":"名师主讲+辅导老师，打牢数学基础","difficulty":"困难","difficultyStar":5,"tags":["深度探究","思维拓展"]}]}';
    var result = json.decode(jsonStr);
    return CourseListModel.fromJson(result);
  }
}
