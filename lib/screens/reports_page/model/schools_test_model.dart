class SchoolsTest {
  String? cityName;
  String? districtName;
  String? neighborhoodName;
  String? schoolName;

  SchoolsTest(
      {this.cityName,
      this.districtName,
      this.neighborhoodName,
      this.schoolName});

  SchoolsTest.fromJson(Map<String, dynamic> json) {
    cityName = json['city_name'];
    districtName = json['district_name'];
    neighborhoodName = json['neighborhood_name'];
    schoolName = json['school_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_name'] = cityName;
    data['district_name'] = districtName;
    data['neighborhood_name'] = neighborhoodName;
    data['school_name'] = schoolName;
    return data;
  }
}
