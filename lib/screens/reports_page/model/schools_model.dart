class SchoolsModel {
  int? id;
  String? name;
  int? cityId;
  int? districtId;
  int? neighborhoodId;

  SchoolsModel(
      {this.id, this.name, this.cityId, this.districtId, this.neighborhoodId});

  SchoolsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    neighborhoodId = json['neighborhood_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['district_id'] = districtId;
    data['neighborhood_id'] = neighborhoodId;
    return data;
  }
}