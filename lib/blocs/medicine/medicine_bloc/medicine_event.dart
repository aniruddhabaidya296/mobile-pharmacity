part of 'medicine_bloc.dart';

abstract class MedicineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllMedicines extends MedicineEvent {}

class SearchMedicine extends MedicineEvent {
  final String word;
  SearchMedicine({this.word});

  @override
  List<Object> get props => [word];
}

class FetchMedicine extends MedicineEvent {
  final String medicineId;
  FetchMedicine({this.medicineId});

  @override
  List<Object> get props => [medicineId];
}

class CreateMedicine extends MedicineEvent {
  final String text;
  CreateMedicine({this.text});

  @override
  List<Object> get props => [text];
}

class UpdateMedicine extends MedicineEvent {
  final Medicine medicine;
  UpdateMedicine({this.medicine});

  @override
  List<Object> get props => [Medicine];
}

class DeleteMedicine extends MedicineEvent {
  final String medicineId;
  DeleteMedicine({this.medicineId});

  @override
  List<Object> get props => [medicineId];
}

class DeleteAllMedicines extends MedicineEvent {}
