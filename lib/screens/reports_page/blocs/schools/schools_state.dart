part of 'schools_bloc.dart';

abstract class SchoolsState extends Equatable {
  const SchoolsState();
  
  @override
  List<Object> get props => [];
}

class SchoolsInitial extends SchoolsState {}
