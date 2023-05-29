import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/service/reports_service.dart';

import '../../../../constants/enums/bloc_status.dart';

part 'neighborhoods_event.dart';
part 'neighborhoods_state.dart';

class NeighborhoodsBloc extends Bloc<NeighborhoodsEvent, NeighborhoodsState> {
  final ReportsService _service = ReportsService();
  NeighborhoodsBloc() : super(const NeighborhoodsState()) {
    on<NeighborhoodsEvent>((event, emit) async {
      try {
        final response = await _service.getListNeighborhoods(
            event.districtsId, event.cityId);
        return emit(state.copyWith(status: Status.success, model: response));
      } catch (e) {
        return emit(state.copyWith(status: Status.error));
      }
    });
  }
}
