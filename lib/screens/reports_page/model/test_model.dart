class BoxListTest {
  List<BoxList>? boxList;

  BoxListTest({this.boxList});

  BoxListTest.fromJson(Map<String, dynamic> json) {
    if (json['boxList'] != null) {
      boxList = <BoxList>[];
      json['boxList'].forEach((v) {
        boxList!.add(BoxList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (boxList != null) {
      data['boxList'] = boxList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BoxList {
  String? boxNo;
  bool? cumhurBox;
  bool? milletBox;

  BoxList({this.boxNo, this.cumhurBox, this.milletBox});

  BoxList.fromJson(Map<String, dynamic> json) {
    boxNo = json['boxNo'];
    cumhurBox = json['cumhurBox'];
    milletBox = json['milletBox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['boxNo'] = boxNo;
    data['cumhurBox'] = cumhurBox;
    data['milletBox'] = milletBox;
    return data;
  }
}
