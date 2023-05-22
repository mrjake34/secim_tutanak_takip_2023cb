import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/reports_model.dart';
import 'reports_service_interface.dart';

class ReportsService extends IReportsService {
  @override
  Future<List?> getListCities() async {
    // final response = await dio.get(
    //   citiesPath,
    // );
    try {
      String jsonString =
          await rootBundle.loadString('assets/json/bayburt.json');
      List cities = json.decode(jsonString);
      return cities;
    } catch (e) {
      return null;
    }
    // if (response.statusCode == 200) {
    //   List? cities = response.data;
    //   changeLoading();
    //   emit(CitiesState(cities ?? []));
    // } else if (response.statusCode == 400) {
    // } else if (response.statusCode == 404) {
    // } else {}
  }

  @override
  Future<AddressModel?> getListDistricts(int? id) async {
    if (id != null) {
      // final response = await dio.get(
      //   "https://api-sonuc.oyveotesi.org/api/v1/cities/$id/districts",
      // );

      // if (response.statusCode == 200) {
      //   List? districts = response.data;
      //   print(districts);
      //   emit(DistrictsState(districts ?? []));
      // } else if (response.statusCode == 400) {
      // } else if (response.statusCode == 404) {
      // } else {}
      String jsonString =
          await rootBundle.loadString('assets/json/bayburt.json');
      List districts = json.decode(jsonString);
      // print(districts);
      // Districts districts = Districts.fromJson(districts);
      // print(districts.where((element) => element['id'] == id));
      final filteredList =
          districts.singleWhere((element) => element['id'] == id);

      AddressModel addressModel = AddressModel.fromJson(filteredList);

      return addressModel;
    } else {
      return null;
    }
  }

  @override
  Future<List<Neighborhoods>?> getListNeighborhoods(
      int? cityId, int? id) async {
    if (id != null && cityId != null) {
      // final response = await dio.get(
      //   "https://api-sonuc.oyveotesi.org/api/v1/cities/$id/districts",
      // );

      // if (response.statusCode == 200) {
      //   List? districts = response.data;
      //   print(districts);
      //   emit(DistrictsState(districts ?? []));
      // } else if (response.statusCode == 400) {
      // } else if (response.statusCode == 404) {
      // } else {}
      String jsonString =
          await rootBundle.loadString('assets/json/bayburt.json');
      List districts = json.decode(jsonString);
      // print(districts);
      // Districts districts = Districts.fromJson(districts);
      // print(districts.where((element) => element['id'] == id));
      final filteredList =
          districts.singleWhere((element) => element['id'] == cityId);

      AddressModel addressModel = AddressModel.fromJson(filteredList);

      final neighborhoods =
          addressModel.districts?.singleWhere((element) => element.id == id);
      List<Neighborhoods>? neighborhoodsList = neighborhoods?.neighborhoods;

      return neighborhoodsList;
    } else {
      return null;
    }
  }

  @override
  Future<List<Schools>?> getListSchools(
      int? cityId, int? id, int? neighborhoodId) async {
    if (id != null && cityId != null && neighborhoodId != null) {
      // final response = await dio.get(
      //   "https://api-sonuc.oyveotesi.org/api/v1/cities/$id/districts",
      // );

      // if (response.statusCode == 200) {
      //   List? districts = response.data;
      //   print(districts);
      //   emit(DistrictsState(districts ?? []));
      // } else if (response.statusCode == 400) {
      // } else if (response.statusCode == 404) {
      // } else {}
      String jsonString =
          await rootBundle.loadString('assets/json/bayburt.json');
      List districts = json.decode(jsonString);
      // print(districts);
      // Districts districts = Districts.fromJson(districts);
      // print(districts.where((element) => element['id'] == id));
      final filteredList =
          districts.singleWhere((element) => element['id'] == cityId);

      AddressModel addressModel = AddressModel.fromJson(filteredList);

      final neighborhoods = addressModel.districts
          ?.singleWhere((element) => element.id == neighborhoodId);
      List<Neighborhoods>? neighborhoodsList = neighborhoods?.neighborhoods;

      final schools =
          neighborhoodsList?.singleWhere((element) => element.id == id);

      return schools?.schools;
    } else {
      return null;
    }
  }
}
