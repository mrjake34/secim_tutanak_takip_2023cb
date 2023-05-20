import 'package:flutter/material.dart';

@immutable
abstract class ReportsState {
  const ReportsState();
  // const ReportsState({
  //   this.isLoading = false,
  //   this.cities,
  //   this.districts,
  //   this.neighborhoods,
  //   this.schools,
  // });
  // final bool isLoading;
  // final List? cities;
  // final List? districts;
  // final List? neighborhoods;
  // final List? schools;

  // ReportsState copyWith({
  //   final bool? isLoading,
  //   final List? cities,
  //   final List? districts,
  //   final List? neighborhoods,
  //   final List? schools,
  // }) {
  //   return ReportsState(
  //     isLoading: isLoading ?? this.isLoading,
  //     cities: cities,
  //     districts: districts,
  //     neighborhoods: neighborhoods,
  //     schools: schools
  //   );
  // }
}

class ReportInitial extends ReportsState {}

class StateLoading extends ReportsState {
  final bool isLoading;
  const StateLoading({
    required this.isLoading,
  });
}

class CitiesState extends ReportsState {
  final List cities;

  const CitiesState(this.cities);
}

class DistrictsState extends ReportsState {
  final List districts;

  const DistrictsState(this.districts);
}
