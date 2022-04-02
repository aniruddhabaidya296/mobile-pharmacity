part of 'men_bloc.dart';

abstract class MenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllMens extends MenEvent {}

class FetchMen extends MenEvent {
  final String medicineId;
  FetchMen({this.medicineId});

  @override
  List<Object> get props => [medicineId];
}
