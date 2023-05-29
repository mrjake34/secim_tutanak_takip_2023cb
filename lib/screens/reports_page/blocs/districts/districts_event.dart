part of 'districts_bloc.dart';

class DistrictsEvent extends Equatable {
  const DistrictsEvent({this.cityId, this.districtId});
  final int? cityId;
  final int? districtId;

  @override
  List<Object> get props => [];
}
