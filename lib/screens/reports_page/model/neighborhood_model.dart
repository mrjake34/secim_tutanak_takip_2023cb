class NeighborhoodModel {
  int? cityId;
  String? cityName;
  int? districtId;
  String? districtName;
  int? neighborId;
  String? neighborName;

  NeighborhoodModel(
      {this.cityId,
      this.cityName,
      this.districtId,
      this.districtName,
      this.neighborId,
      this.neighborName});

  NeighborhoodModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    neighborId = json['neighbor_id'];
    neighborName = json['neighbor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['neighbor_id'] = neighborId;
    data['neighbor_name'] = neighborName;
    return data;
  }
}
