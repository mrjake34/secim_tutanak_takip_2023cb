import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsBloc() : super(const ReportsState()) {
    on<ReportsEvent>((event, emit) async {
      await getListCities(event, emit);
    });
  }
  Future<void> getListCities(
      ReportsEvent event, Emitter<ReportsState> emit) async {
    // final response = await dio.get(
    //   citiesPath,
    // );
    String jsonString = await rootBundle.loadString('assets/json/bayburt.json');
    List cities = json.decode(jsonString);
    print(jsonString);
    if (event is CitiesFetch) {
      print(event);
      emit(state.copyWith(cities: cities, isLoading: false));
    }

    // if (response.statusCode == 200) {
    //   List? cities = response.data;
    //   changeLoading();
    //   emit(CitiesState(cities ?? []));
    // } else if (response.statusCode == 400) {
    // } else if (response.statusCode == 404) {
    // } else {}
  }
}
