// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AddressModel extends Equatable {
  int? id;
  String? name;
  int? plate;
  List<Districts>? districts;

  AddressModel({this.id, this.name, this.plate, this.districts});

  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    plate = json['plate'];
    if (json['districts'] != null) {
      districts = <Districts>[];
      json['districts'].forEach((v) {
        districts!.add(Districts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['plate'] = plate;
    if (districts != null) {
      data['districts'] = districts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [id,name,plate,districts];
}

class Districts extends Equatable {
  int? id;
  String? name;
  int? cityId;
  List<Neighborhoods>? neighborhoods;

  Districts({this.id, this.name, this.cityId, this.neighborhoods});

  Districts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    if (json['neighborhoods'] != null) {
      neighborhoods = <Neighborhoods>[];
      json['neighborhoods'].forEach((v) {
        neighborhoods!.add(Neighborhoods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    if (neighborhoods != null) {
      data['neighborhoods'] =
          neighborhoods!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [id,name,cityId,neighborhoods];
}

class Neighborhoods extends Equatable {
  int? id;
  String? name;
  int? cityId;
  int? districtId;
  List<Schools>? schools;

  Neighborhoods(
      {this.id, this.name, this.cityId, this.districtId, this.schools});

  Neighborhoods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    districtId = json['district_id'];
    if (json['schools'] != null) {
      schools = <Schools>[];
      json['schools'].forEach((v) {
        schools!.add(Schools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['city_id'] = cityId;
    data['district_id'] = districtId;
    if (schools != null) {
      data['schools'] = schools!.map((v) => v.toJson()).toList();
    }
    return data;
  }
  
  @override
  List<Object?> get props => [id,name,cityId,districtId,schools];
}
class Schools extends Equatable {
  int? id;
  String? name;
  int? cityId;
  int? districtId;
  int? neighborhoodId;

  Schools(
      {this.id, this.name, this.cityId, this.districtId, this.neighborhoodId});

  Schools.fromJson(Map<String, dynamic> json) {
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
  
  @override
  List<Object?> get props => [id,name,cityId,districtId,neighborhoodId];
}
