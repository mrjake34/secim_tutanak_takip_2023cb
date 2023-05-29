part of 'neighborhoods_bloc.dart';

class NeighborhoodsEvent extends Equatable {
  const NeighborhoodsEvent({this.cityId, this.districtsId});
  final int? cityId;
  final int? districtsId;

  @override
  List<Object> get props => [];
}
