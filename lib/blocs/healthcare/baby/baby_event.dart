part of 'baby_bloc.dart';

abstract class BabyEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllBabys extends BabyEvent {}

class FetchBaby extends BabyEvent {
  final String medicineId;
  FetchBaby({this.medicineId});

  @override
  List<Object> get props => [medicineId];
}
