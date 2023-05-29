import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'reports_service_interface.dart';

class ReportsService extends IReportsService {
  Dio dio = Dio();

  @override
  Future<List?> getListCities() async {
    // final response = await dio.get(
    //   citiesPath,
    // );
    try {
      String jsonString = await rootBundle.loadString('assets/json/il.json');
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
  Future<List?> getListDistricts(int? id) async {
    if (id != null) {
      String jsonString =
          await rootBundle.loadString('assets/json/districts.json');
      List districts = json.decode(jsonString);

      final filteredList =
          districts.where((element) => element["city_id"] == id).toList();

      return filteredList;
    } else {
      return null;
    }
  }

  @override
  Future<List?> getListNeighborhoods(int? districtId, int? id) async {
    if (id != null && districtId != null) {
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
          await rootBundle.loadString('assets/json/neighborhoods/$id.json');

      List districts = json.decode(jsonString);
      final filteredList = districts
          .where((element) => element["district_id"] == districtId)
          .toList();

      return filteredList;
    } else {
      return null;
    }
  }

  @override
  Future<List?> getListSchools(
      int? cityId, int? districtId, int? neighborhoodId) async {
    if (cityId != null && districtId != null && neighborhoodId != null) {
      final response = await dio.get(
        "https://api-sonuc.oyveotesi.org/api/v1/cities/$cityId/districts/$districtId/neighborhoods/$neighborhoodId/schools",
      );

      if (response.statusCode == 200) {
        List? districts = response.data;

        return districts;
      }
      // String jsonString =
      //     await rootBundle.loadString('assets/json/schools.json');

      // List schoolList = json.decode(jsonString);
      // print(schoolList);

      // print(districts);
      // Districts districts = Districts.fromJson(districts);
      // print(districts.where((element) => element['id'] == id));
      // final filteredList = schoolList.where((element) =>
      //     element['neighborhood_name'] == neighborhoodModel.neighborName);

      // return schoolList;
    } else {
      return null;
    }
    return null;
  }
}
