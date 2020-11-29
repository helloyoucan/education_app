/// list : [{"type":"","description":"","coverURL":"","name":"","subTitle":"","difficulty":"","difficultyStar":3,"tags":[""]},null]

class CourseListModel {
  List<CourseItem> _list;

  List<CourseItem> get list => _list;

  CourseListModel({List<CourseItem> list}) {
    _list = list;
  }

  CourseListModel.fromJson(dynamic json) {
    if (json["list"] != null) {
      _list = [];
      json["list"].forEach((v) {
        _list.add(CourseItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_list != null) {
      map["list"] = _list.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// type : ""
/// description : ""
/// coverURL : ""
/// name : ""
/// subTitle : ""
/// difficulty : ""
/// difficultyStar : 3
/// tags : [""]

class CourseItem {
  String _type;
  String _description;
  String _coverURL;
  String _name;
  String _subTitle;
  String _difficulty;
  int _difficultyStar;
  List<String> _tags;

  String get type => _type;
  String get description => _description;
  String get coverURL => _coverURL;
  String get name => _name;
  String get subTitle => _subTitle;
  String get difficulty => _difficulty;
  int get difficultyStar => _difficultyStar;
  List<String> get tags => _tags;

  CourseItem(
      {String type,
      String description,
      String coverURL,
      String name,
      String subTitle,
      String difficulty,
      int difficultyStar,
      List<String> tags}) {
    _type = type;
    _description = description;
    _coverURL = coverURL;
    _name = name;
    _subTitle = subTitle;
    _difficulty = difficulty;
    _difficultyStar = difficultyStar;
    _tags = tags;
  }

  CourseItem.fromJson(dynamic json) {
    _type = json["type"];
    _description = json["description"];
    _coverURL = json["coverURL"];
    _name = json["name"];
    _subTitle = json["subTitle"];
    _difficulty = json["difficulty"];
    _difficultyStar = json["difficultyStar"];
    _tags = json["tags"] != null ? json["tags"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["type"] = _type;
    map["description"] = _description;
    map["coverURL"] = _coverURL;
    map["name"] = _name;
    map["subTitle"] = _subTitle;
    map["difficulty"] = _difficulty;
    map["difficultyStar"] = _difficultyStar;
    map["tags"] = _tags;
    return map;
  }
}
