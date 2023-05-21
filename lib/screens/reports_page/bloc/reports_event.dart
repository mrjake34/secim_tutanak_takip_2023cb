// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reports_bloc.dart';

sealed class ReportsEvent extends Equatable {}

@immutable
class CitiesFetch extends ReportsEvent {
  List cities;
  CitiesFetch({
    required this.cities,
  });
  @override
  List<Object?> get props => [cities];
}

@immutable
class DistrictsFetch extends ReportsEvent {
  List districts;
  DistrictsFetch({
    required this.districts,
  });
  @override
  List<Object?> get props => [districts];


}

@immutable
class IsLoading extends ReportsEvent {
  final bool isLoading;
  IsLoading({
    required this.isLoading,
  });
  @override
  List<Object?> get props => [isLoading];
}
