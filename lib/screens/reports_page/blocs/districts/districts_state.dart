// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'districts_bloc.dart';

class DistrictsState extends Equatable {
  const DistrictsState(
      {this.cityId, this.districtId, this.districts, this.status});
  final int? cityId;
  final int? districtId;
  final List<dynamic>? districts;
  final Enum? status;

  @override
  List<Object> get props => [];

  DistrictsState copyWith({
    int? cityId,
    int? districtId,
    List<dynamic>? districts,
    Enum? status,
  }) {
    return DistrictsState(
      cityId: cityId ?? this.cityId,
      districtId: districtId ?? this.districtId,
      districts: districts ?? this.districts,
      status: status ?? this.status,
    );
  }
}
