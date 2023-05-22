// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reports_bloc.dart';

class ReportsState extends Equatable {
  ReportsState({
    this.cities = const [],
    this.districts = const [],
    this.status = const StatusInitialize(),
    this.model,
    this.neighborhoods,
    this.schools,
    this.serviceStatus,
  });

  final List cities;
  AddressModel? model;
  final List<Districts> districts;
  final List<Neighborhoods>? neighborhoods;
  final List<Schools>? schools;
  final ReportStatus? status;
  final ServiceStatus? serviceStatus;

  @override
  List<Object?> get props => [cities, districts, status];

  ReportsState copyWith({
    List? cities,
    List<Districts>? districts,
    List<Neighborhoods>? neighborhoods,
    ReportStatus? status,
    ServiceStatus? serviceStatus,
    AddressModel? model,
    List<Schools>? schools,
  }) {
    return ReportsState(
      cities: cities ?? this.cities,
      districts: districts ?? this.districts,
      status: status ?? this.status,
      model: model ?? this.model,
      neighborhoods: neighborhoods ?? this.neighborhoods,
      schools: schools ?? this.schools,
      serviceStatus: serviceStatus ?? this.serviceStatus,
    );
  }
}
