class PractiseModel {
  List<PractiseModelItem> list;

  PractiseModel({this.list});

  PractiseModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<PractiseModelItem>();
      json['list'].forEach((v) {
        list.add(new PractiseModelItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PractiseModelItem {
  String section;
  String preview;
  int totalQuestion;
  int correctQuestion;

  PractiseModelItem(
      {this.section, this.preview, this.totalQuestion, this.correctQuestion});

  PractiseModelItem.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    preview = json['preview'];
    totalQuestion = json['totalQuestion'];
    correctQuestion = json['correctQuestion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['preview'] = this.preview;
    data['totalQuestion'] = this.totalQuestion;
    data['correctQuestion'] = this.correctQuestion;
    return data;
  }
}
