// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reports_bloc.dart';

class ReportsState extends Equatable {
  const ReportsState({
    this.cities = const [],
    this.districts = const [],
    this.status = const StatusInitialize(),
    this.city,
    this.neighborhoods,
    this.schools,
    this.serviceStatus,
    this.ballotBoxes,
    this.district,
    this.neighborhood,
    this.school,
  });

  final List cities;
  final CityModel? city;
  final DistrictModel? district;
  final NeighborhoodModel? neighborhood;
  final SchoolsModelJson? school;
  final List districts;
  final List? neighborhoods;
  final List? schools;
  final ReportStatus? status;
  final ServiceStatus? serviceStatus;
  final List? ballotBoxes;

  @override
  List<Object?> get props => [
        cities,
        districts,
        status,
        city,
        ballotBoxes,
        status,
        serviceStatus,
        schools,
        school,
        district,
        neighborhood,
        neighborhoods
      ];

  ReportsState copyWith({
    List? cities,
    CityModel? city,
    DistrictModel? district,
    NeighborhoodModel? neighborhood,
    SchoolsModelJson? school,
    List? districts,
    List? neighborhoods,
    List? schools,
    ReportStatus? status,
    ServiceStatus? serviceStatus,
    List? ballotBoxes,
  }) {
    return ReportsState(
      cities: cities ?? this.cities,
      city: city ?? this.city,
      district: district ?? this.district,
      neighborhood: neighborhood ?? this.neighborhood,
      school: school ?? this.school,
      districts: districts ?? this.districts,
      neighborhoods: neighborhoods ?? this.neighborhoods,
      schools: schools ?? this.schools,
      status: status ?? this.status,
      serviceStatus: serviceStatus ?? this.serviceStatus,
      ballotBoxes: ballotBoxes ?? this.ballotBoxes,
    );
  }
}
