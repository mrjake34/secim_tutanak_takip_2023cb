part of 'neighborhoods_bloc.dart';

class NeighborhoodsState extends Equatable {
  const NeighborhoodsState({this.status, this.cityId, this.districtsId, this.model});
  final Enum? status;
  final int? cityId;
  final int? districtsId;
  final List? model;

  @override
  List<Object> get props => [];

  NeighborhoodsState copyWith({
    Enum? status,
    int? cityId,
    int? districtsId,
    List? model,
  }) {
    return NeighborhoodsState(
      status: status ?? this.status,
      cityId: cityId ?? this.cityId,
      districtsId: districtsId ?? this.districtsId,
      model: model ?? this.model,
    );
  }
}