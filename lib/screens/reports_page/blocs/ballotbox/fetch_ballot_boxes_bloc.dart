// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:secim_tutanak_takip_2023cb/constants/enums/bloc_status.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/model/ballotbox_model.dart';

import '../../service/ballotbox_service.dart';

part 'fetch_ballot_boxes_event.dart';
part 'fetch_ballot_boxes_state.dart';

class FetchBallotBoxesBloc
    extends Bloc<FetchBallotBoxesEvent, FetchBallotBoxesState> {
  BallotBoxService boxService = BallotBoxService();
  FetchBallotBoxesBloc() : super(const FetchBallotBoxesState()) {
    on<FetchBallotBoxesEvent>((event, emit) async {
      try {
        final response = await boxService.fetchBallotBoxes(event.schoolId);
        print("Response $response");
        return emit(state.copyWith(status: Status.success, model: response));
      } catch (e) {
        return emit(state.copyWith(status: Status.error));
      }
    });
  }
}
