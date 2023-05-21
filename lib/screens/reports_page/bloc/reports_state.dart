// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reports_bloc.dart';

class ReportsState extends Equatable {
  ReportsState(
      {this.cities = const [],
      this.districts = const [],
      this.status = const StatusInitialize(), this.model});

  final List cities;
  AddressModel? model;
  final List<Districts> districts;
  final ReportStatus? status;

  @override
  List<Object?> get props => [cities, districts, status];

  ReportsState copyWith({
    List? cities,
    List<Districts>? districts,
    ReportStatus? status,
    AddressModel? model,
  }) {
    return ReportsState(
      cities: cities ?? this.cities,
      districts: districts ?? this.districts,
      status: status ?? this.status,
      model: model ?? this.model,
    );
  }
}
