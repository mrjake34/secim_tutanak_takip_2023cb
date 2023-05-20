import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../constants/network/constants_network.dart';
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
    final response = await dio.get(
      citiesPath,
    );

    if (response.statusCode == 200) {
      List? cities = response.data;
      changeLoading();
      emit(CitiesState(cities ?? []));
    } else if (response.statusCode == 400) {
    } else if (response.statusCode == 404) {
    } else {}
  }

  Future<void> getListDistricts(int id) async {
    final response = await dio.get(
      "https://api-sonuc.oyveotesi.org/api/v1/cities/$id/districts",
    );

    if (response.statusCode == 200) {
      List? districts = response.data;
      print(districts);
      emit(DistrictsState(districts ?? []));
    } else if (response.statusCode == 400) {
    } else if (response.statusCode == 404) {
    } else {}
  }
}
