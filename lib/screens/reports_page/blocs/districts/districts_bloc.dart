import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:secim_tutanak_takip_2023cb/screens/reports_page/service/reports_service.dart';

import '../../../../constants/enums/bloc_status.dart';

part 'districts_event.dart';
part 'districts_state.dart';

class DistrictsBloc extends Bloc<DistrictsEvent, DistrictsState> {
  ReportsService? service = ReportsService();
  DistrictsBloc() : super(const DistrictsState()) {
    on<DistrictsEvent>((event, emit) async {
      try {
        final response = await service?.getListDistricts(event.cityId);
        if (response?.isNotEmpty == true) {
          return emit(
              state.copyWith(status: Status.success, districts: response));
        }
      } catch (e) {
        return emit(state.copyWith(status: Status.error));
      }
    });
  }
}
