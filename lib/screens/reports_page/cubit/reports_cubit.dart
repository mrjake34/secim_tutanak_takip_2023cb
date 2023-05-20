import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/districts_test_model.dart';

import 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(ReportInitial());
  Dio dio = Dio();
  bool isLoading = false;

  void changeLoading() {
    isLoading = !isLoading;
    emit(StateLoading(isLoading: isLoading));
  }

  Future<void> getListCities() async {
    changeLoading();
    // final response = await dio.get(
    //   citiesPath,
    // );
    String jsonString = await rootBundle.loadString('assets/json/il.json');
    List cities = json.decode(jsonString);
    emit(CitiesState(cities));
    changeLoading();
    // if (response.statusCode == 200) {
    //   List? cities = response.data;
    //   changeLoading();
    //   emit(CitiesState(cities ?? []));
    // } else if (response.statusCode == 400) {
    // } else if (response.statusCode == 404) {
    // } else {}
  }

  Future<void> getListDistricts(int id) async {
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
    String jsonString = await rootBundle.loadString('assets/json/ilce.json');
    List districts = json.decode(jsonString);

    // print(districts.where((element) => element['cityId'] == id));
    final filteredList =
        districts.where((element) => element['cityId'] == id).toList();

    final jsonList = DistrictsTestModel.fromJson(filteredList.first);
    print(jsonList.addressModel);
    emit(DistrictsState(jsonList.addressModel as List));
  }
}
