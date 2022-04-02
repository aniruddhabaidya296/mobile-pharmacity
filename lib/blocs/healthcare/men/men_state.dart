part of 'men_bloc.dart';

abstract class MenState extends Equatable {
  @override
  List<Object> get props => [];
}

class MenInitial extends MenState {}

class MenLoading extends MenState {}

class MenSuccess extends MenState {}

class SearchMenSuccess extends MenState {
  final List<HealthCare> menProducts;
  SearchMenSuccess({@required this.menProducts});
  @override
  List<Object> get props => [menProducts];
}

class FetchMensSuccess extends MenState {
  final List<HealthCare> menProducts;
  FetchMensSuccess({@required this.menProducts});
  @override
  List<Object> get props => [menProducts];
}

class MenFailure extends MenState {
  final String message;

  MenFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
