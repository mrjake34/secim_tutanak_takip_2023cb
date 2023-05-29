part of 'fetch_ballot_boxes_bloc.dart';

class FetchBallotBoxesEvent extends Equatable {
  const FetchBallotBoxesEvent({required this.schoolId});
  final int schoolId;
  @override
  List<Object> get props => [];
}
