// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reports_bloc.dart';

sealed class ReportsEvent extends Equatable {}

@immutable
class CitiesFetch extends ReportsEvent {
  @override
  List<Object?> get props => [];
}

@immutable
class DistrictsFetch extends ReportsEvent {
  int cityId;
  DistrictsFetch({
    required this.cityId,
  });
  @override
  List<Object?> get props => [];
}

class NeighborhoodsFetch extends ReportsEvent {
  int districtId;
  int cityId;
  NeighborhoodsFetch({
    required this.districtId,
    required this.cityId,
  });
  @override
  List<Object?> get props => [];
}

class SchoolsFetch extends ReportsEvent {
  int neighborhoodId;
  int cityId;
  int districtId;
  SchoolsFetch({
    required this.districtId,
    required this.cityId,
    required this.neighborhoodId,
  });
  @override
  List<Object?> get props => [];
}

class BallotBoxesFetch extends ReportsEvent {
  int? schoolId;
  BallotBoxesFetch({
    this.schoolId,
  });
  @override
  List<Object?> get props => [];
}

class ServiceEnabled extends ReportsEvent {
  @override
  List<Object?> get props => [];
}
