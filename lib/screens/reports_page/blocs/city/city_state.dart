// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'city_bloc.dart';

class CityState extends Equatable {
  const CityState({this.cities, this.city, this.status});
  final List? cities;
  final CityModel? city;
  final Enum? status;

  @override
  List<Object> get props => [];

  CityState copyWith({
    List? cities,
    CityModel? city,
    Enum? status,
  }) {
    return CityState(
      cities: cities ?? this.cities,
      city: city ?? this.city,
      status: status ?? this.status,
    );
  }
}
