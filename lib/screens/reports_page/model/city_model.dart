class CityModel {
  int? id;
  String? name;
  int? plate;

  CityModel({this.id, this.name, this.plate});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    plate = json['plate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['plate'] = plate;
    return data;
  }
}