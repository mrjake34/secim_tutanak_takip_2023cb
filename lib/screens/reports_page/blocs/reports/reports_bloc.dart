import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/constants/enums/bloc_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/schools_model.dart';
import '../../service/reports_service.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  ReportsService? service = ReportsService();

  Dio dio = Dio();

  ReportsBloc() : super(const ReportsState()) {
    on<SchoolsFetch>((event, emit) async {
      final int districtId = event.districtId;
      final int cityId = event.cityId;
      final int neighborhoodId = event.neighborhoodId;
      await fetchListSchools(event, emit, districtId, cityId, neighborhoodId);
    });

    on<ServiceEnabled>((event, emit) async {
      await serviceCheck(event, emit);
    });
  }



  Future fetchListSchools(ReportsEvent event, Emitter<ReportsState> emit,
      int cityId, int districtId, int neighborhoodId) async {
    if (event is SchoolsFetch) {
      emit(state.copyWith(status: Status.loading));
      try {
        final response =
            await service?.getListSchools(cityId, districtId, neighborhoodId);
        emit(state.copyWith(status: Status.success, schools: response));
      } catch (e) {
        emit(state.copyWith(status: Status.error));
      }
    }
  }

  Future serviceCheck(ReportsEvent event, Emitter<ReportsState> emit) async {
    try {
      // return emit(state.copyWith(serviceStatus: NetworkReady()));
      final response = await dio.get(
        "https://api-sonuc.oyveotesi.org/api/v1/cities",
      );
      if (response.statusCode == HttpStatus.ok) {
        return emit(state.copyWith(serviceStatus: Status.networkReady));
      } else {
        return emit(state.copyWith(serviceStatus: Status.error));
      }
      // print(response);
      // await Future.delayed(const Duration(seconds: 2));
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        return emit(state.copyWith(serviceStatus: Status.networkNotReady));
      } else {
        return emit(state.copyWith(serviceStatus: Status.networkError));
      }
    }
  }
}
