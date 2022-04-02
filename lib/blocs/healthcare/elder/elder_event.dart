part of 'elder_bloc.dart';

abstract class ElderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllElders extends ElderEvent {}

class FetchElder extends ElderEvent {
  final String medicineId;
  FetchElder({this.medicineId});

  @override
  List<Object> get props => [medicineId];
}
