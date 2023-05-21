import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'reports_status.dart';
import '../model/reports_model.dart';
import '../service/reports_service.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final ReportsService? service;
  final BuildContext context;

  ReportsBloc({
    required this.context,
    required this.service,
  }) : super(ReportsState()) {
    on<CitiesFetch>((event, emit) async {
      await getListCities(event, emit);
    });
    on<DistrictsFetch>((event, emit) async {
      final int id = event.id;
      await getListDistricts(event, emit, id);
    });
  }

  Future getListCities(ReportsEvent event, Emitter<ReportsState> emit) async {
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

  Future getListDistricts(
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
}
