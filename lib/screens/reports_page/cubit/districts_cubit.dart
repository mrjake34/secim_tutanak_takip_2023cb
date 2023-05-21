import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

import '../model/reports_model.dart';

part 'districts_state.dart';

class DistrictsCubit extends Cubit<DistrictsState> {
  DistrictsCubit() : super(DistrictsState());

  Future<void> getListDistricts(int? id) async {
    print("ID $id");
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
      final filteredList = districts.where((element) => element['id'] == id);

      AddressModel jsonList = AddressModel.fromJson(filteredList.first);

      emit(DistrictsState(districts: jsonList.districts));
      // emit(DistrictsState(districts));
    } else {
      emit(DistrictsState(districts: const []));
    }
  }
}
