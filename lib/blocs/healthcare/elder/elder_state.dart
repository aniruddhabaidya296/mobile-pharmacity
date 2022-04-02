part of 'elder_bloc.dart';

abstract class ElderState extends Equatable {
  @override
  List<Object> get props => [];
}

class ElderInitial extends ElderState {}

class ElderLoading extends ElderState {}

class ElderSuccess extends ElderState {}

class SearchElderSuccess extends ElderState {
  final List<HealthCare> menProducts;
  SearchElderSuccess({@required this.menProducts});
  @override
  List<Object> get props => [menProducts];
}

class FetchEldersSuccess extends ElderState {
  final List<HealthCare> elderProducts;
  FetchEldersSuccess({@required this.elderProducts});
  @override
  List<Object> get props => [elderProducts];
}

class ElderFailure extends ElderState {
  final String message;

  ElderFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
