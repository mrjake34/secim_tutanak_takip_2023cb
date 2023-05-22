import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secim_tutanak_takip_2023cb/base/service/utils/utils.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/service/ballotbox_service.dart';
import 'reports_status.dart';
import '../model/reports_model.dart';
import '../service/reports_service.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final ReportsService? service;
  final BallotBoxService boxService;
  final BuildContext context;
  Dio dio = Dio();

  ReportsBloc({
    required this.context,
    required this.service,
    required this.boxService,
  }) : super(ReportsState()) {
    on<CitiesFetch>((event, emit) async {
      await fetchListCities(event, emit);
    });
    on<DistrictsFetch>((event, emit) async {
      final int id = event.id;
      await fetchListDistricts(event, emit, id);
    });
    on<NeighborhoodsFetch>((event, emit) async {
      final int id = event.id;
      final int cityId = event.cityId;
      await fetchListNeighborhoods(event, emit, cityId, id);
    });
    on<SchoolsFetch>((event, emit) async {
      final int id = event.id;
      final int cityId = event.cityId;
      final int neighborhoodId = event.neighborhoodId;
      await fetchListSchools(event, emit, id, cityId, neighborhoodId);
    });
    on<BallotBoxesFetch>((event, emit) async {
      await fetchBallotBox(event, emit);
    });
    on<ServiceEnabled>((event, emit) async {
      await serviceCheck(event, emit);
    });
  }

  Future fetchListCities(ReportsEvent event, Emitter<ReportsState> emit) async {
    if (event is CitiesFetch) {
      emit(state.copyWith(status: ReportLoading()));
      try {
        final response = await service?.getListCities();
        emit(state.copyWith(status: ReportSuccess(), cities: response));
      } catch (e) {
        emit(state.copyWith(status: ReportError(e)));
      }
    }
  }

  Future fetchListDistricts(
      ReportsEvent event, Emitter<ReportsState> emit, int id) async {
    if (event is DistrictsFetch) {
      emit(state.copyWith(status: ReportLoading()));
      try {
        final response = await service?.getListDistricts(id);
        emit(state.copyWith(
            status: ReportSuccess(), districts: response?.districts));
      } catch (e) {
        emit(state.copyWith(status: ReportError(e)));
      }
    }
  }

  Future fetchListNeighborhoods(
    ReportsEvent event,
    Emitter<ReportsState> emit,
    int id,
    int cityId,
  ) async {
    if (event is NeighborhoodsFetch) {
      emit(state.copyWith(status: ReportLoading()));
      try {
        final response = await service?.getListNeighborhoods(id, cityId);
        emit(state.copyWith(status: ReportSuccess(), neighborhoods: response));
      } catch (e) {
        emit(state.copyWith(status: ReportError(e)));
      }
    }
  }

  Future fetchListSchools(ReportsEvent event, Emitter<ReportsState> emit,
      int id, int cityId, int neighborhoodId) async {
    if (event is SchoolsFetch) {
      emit(state.copyWith(status: ReportLoading()));
      try {
        final response =
            await service?.getListSchools(cityId, id, neighborhoodId);
        emit(state.copyWith(status: ReportSuccess(), schools: response));
      } catch (e) {
        emit(state.copyWith(status: ReportError(e)));
      }
    }
  }

  Future fetchBallotBox(ReportsEvent event, Emitter<ReportsState> emit) async {
    if (event is BallotBoxesFetch) {
      emit(state.copyWith(status: ReportLoading()));
      // try {
      final response = await boxService.fetchBallotBoxes();
      print(response);
      emit(state.copyWith(status: ReportSuccess()));
      //   } catch (e) {
      //     emit(state.copyWith(status: ReportError(e)));
      //   }
    }
  }

  Future serviceCheck(ReportsEvent event, Emitter<ReportsState> emit) async {
    try {
      return emit(state.copyWith(serviceStatus: NetworkReady()));
      // final response = await dio.get(
      //   "https://api-sonuc.oyveotesi.org/api/v1/cities",
      // );
      // print(response.statusCode);
      // if (response.statusCode == HttpStatus.ok) {
      //   return emit(state.copyWith(serviceStatus: NetworkReady()));
      // } else {
      //   return emit(state.copyWith(serviceStatus: NetworkFailed()));
      // }
      // print(response);
      // await Future.delayed(const Duration(seconds: 2));
    } on DioError catch (e) {
      if (e.response?.statusCode == 403) {
        return emit(state.copyWith(serviceStatus: NetworkNotReady()));
      } else {
        return emit(state.copyWith(serviceStatus: NetworkFailed()));
      }
    }
  }
}
