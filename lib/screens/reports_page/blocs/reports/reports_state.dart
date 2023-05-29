// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'reports_bloc.dart';

class ReportsState extends Equatable {
  const ReportsState({
    this.status,
    this.serviceStatus,
    this.schools,
    this.school,
  });

  final SchoolsModel? school;
  final List? schools;
  final Enum? status;
  final Enum? serviceStatus;

  @override
  List<Object?> get props => [
        status,
        status,
        schools,
        school,
      ];

  ReportsState copyWith({
    SchoolsModel? school,
    List? schools,
    Enum? status,
    Enum? serviceStatus,
  }) {
    return ReportsState(
      school: school ?? this.school,
      schools: schools ?? this.schools,
      status: status ?? this.status,
      serviceStatus: serviceStatus ?? this.serviceStatus,
    );
  }
}
