part of 'medicine_bloc.dart';

abstract class MedicineState extends Equatable {
  @override
  List<Object> get props => [];
}

class MedicineInitial extends MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineSuccess extends MedicineState {}

class SearchMedicineSuccess extends MedicineState {
  final List<Medicine> medicines;
  SearchMedicineSuccess({@required this.medicines});
  @override
  List<Object> get props => [medicines];
}

class FetchMedicinesSuccess extends MedicineState {
  final List<Medicine> medicines;
  FetchMedicinesSuccess({@required this.medicines});
  @override
  List<Object> get props => [medicines];
}

class MedicineFailure extends MedicineState {
  final String message;

  MedicineFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
