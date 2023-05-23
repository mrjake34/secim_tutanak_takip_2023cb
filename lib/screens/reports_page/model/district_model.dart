class DistrictModel {
  int? cityId;
  String? cityName;
  String? districtName;
  int? districtId;

  DistrictModel(
      {this.cityId, this.cityName, this.districtName, this.districtId});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    districtName = json['district_name'];
    districtId = json['district_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['district_name'] = districtName;
    data['district_id'] = districtId;
    return data;
  }
}
