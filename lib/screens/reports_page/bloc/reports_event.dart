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
  int id;
  DistrictsFetch({
    required this.id,
  });
  @override
  List<Object?> get props => [];
}
