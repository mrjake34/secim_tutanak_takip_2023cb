class GenelgeModel {
  List<Genelge>? genelge;

  GenelgeModel({this.genelge});

  GenelgeModel.fromJson(Map<String, dynamic> json) {
    if (json['genelge'] != null) {
      genelge = <Genelge>[];
      json['genelge'].forEach((v) {
        genelge!.add(Genelge.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genelge != null) {
      data['genelge'] = genelge!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Genelge {
  String? title;
  String? subTitle;
  String? context;

  Genelge({this.title, this.subTitle, this.context});

  Genelge.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['subTitle'];
    context = json['context'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['context'] = context;
    return data;
  }
}
