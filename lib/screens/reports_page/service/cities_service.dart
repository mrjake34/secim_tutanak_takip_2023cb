import 'dart:convert';

import 'package:flutter/services.dart';

class CitiesService {
   Future<void> getListCities() async {

    // final response = await dio.get(
    //   citiesPath,
    // );
    String jsonString = await rootBundle.loadString('assets/json/bayburt.json');
    List cities = json.decode(jsonString);

    // if (response.statusCode == 200) {
    //   List? cities = response.data;
    //   changeLoading();
    //   emit(CitiesState(cities ?? []));
    // } else if (response.statusCode == 400) {
    // } else if (response.statusCode == 404) {
    // } else {}
  }
}