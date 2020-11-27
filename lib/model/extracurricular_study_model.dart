class ExtracurricularStudyModel {
  List<ExtracurricularStudyModelItem> list;

  ExtracurricularStudyModel({this.list});

  ExtracurricularStudyModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = new List<ExtracurricularStudyModelItem>();
      json['list'].forEach((v) {
        list.add(new ExtracurricularStudyModelItem.fromJson(v));
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

class ExtracurricularStudyModelItem {
  bool isNew;
  String bookName;
  String description;
  String price;
  String discountPrice;
  String readCount;

  ExtracurricularStudyModelItem(
      {this.isNew,
      this.bookName,
      this.description,
      this.price,
      this.discountPrice,
      this.readCount});

  ExtracurricularStudyModelItem.fromJson(Map<String, dynamic> json) {
    isNew = json['isNew'];
    bookName = json['bookName'];
    description = json['description'];
    price = json['price'];
    discountPrice = json['discountPrice'];
    readCount = json['readCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isNew'] = this.isNew;
    data['bookName'] = this.bookName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountPrice'] = this.discountPrice;
    data['readCount'] = this.readCount;
    return data;
  }
}
