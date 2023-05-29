import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'schools_event.dart';
part 'schools_state.dart';

class SchoolsBloc extends Bloc<SchoolsEvent, SchoolsState> {
  SchoolsBloc() : super(SchoolsInitial()) {
    on<SchoolsEvent>((event, emit) {
      
    });
  }
}
