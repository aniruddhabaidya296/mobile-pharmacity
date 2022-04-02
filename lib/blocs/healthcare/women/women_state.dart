part of 'women_bloc.dart';

abstract class WomenState extends Equatable {
  @override
  List<Object> get props => [];
}

class WomenInitial extends WomenState {}

class WomenLoading extends WomenState {}

class WomenSuccess extends WomenState {}

class SearchWomenSuccess extends WomenState {
  final List<HealthCare> menProducts;
  SearchWomenSuccess({@required this.menProducts});
  @override
  List<Object> get props => [menProducts];
}

class FetchWomensSuccess extends WomenState {
  final List<HealthCare> womenProducts;
  FetchWomensSuccess({@required this.womenProducts});
  @override
  List<Object> get props => [womenProducts];
}

class WomenFailure extends WomenState {
  final String message;

  WomenFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
