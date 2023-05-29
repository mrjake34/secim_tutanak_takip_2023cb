// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'fetch_ballot_boxes_bloc.dart';

class FetchBallotBoxesState extends Equatable {
  const FetchBallotBoxesState({this.boxes, this.model, this.status});
  final List? model;
  final Enum? status;
  final BallotBoxes? boxes;
  @override
  List<Object> get props => [boxes.toString(), model.toString()];

  FetchBallotBoxesState copyWith({
    List? model,
    Enum? status,
    BallotBoxes? boxes,
  }) {
    return FetchBallotBoxesState(
      model: model ?? this.model,
      status: status ?? this.status,
      boxes: boxes ?? this.boxes,
    );
  }
}
