import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../constants/enums/bloc_status.dart';
import '../../model/city_model.dart';
import '../../service/reports_service.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  ReportsService? service = ReportsService();
  CityBloc() : super(const CityState()) {
    on<CityEvent>((event, emit) async{
      try {
        final response = await service?.getListCities();
        if (response?.isNotEmpty == true) {
          return emit(state.copyWith(status: Status.success, cities: response));
        }
      } catch (e) {
        return emit(state.copyWith(status: Status.error));
      }
    });
  }
}
