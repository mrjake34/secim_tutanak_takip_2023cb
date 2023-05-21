// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reports_bloc.dart';

class ReportsState extends Equatable {
  const ReportsState({this.cities = const [], this.districts = const [], this.isLoading = false});

  final List cities;
  final List districts;
  final bool isLoading;

  @override
  List<Object> get props => [cities,districts,isLoading];

  ReportsState copyWith({
    List? cities,
    List? districts,
    bool? isLoading,
  }) {
    return ReportsState(
      cities: cities ?? this.cities,
      districts: districts ?? this.districts,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
