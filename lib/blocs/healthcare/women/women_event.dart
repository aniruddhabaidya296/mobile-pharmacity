part of 'women_bloc.dart';

abstract class WomenEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchAllWomens extends WomenEvent {}

class FetchWomen extends WomenEvent {
  final String medicineId;
  FetchWomen({this.medicineId});

  @override
  List<Object> get props => [medicineId];
}
