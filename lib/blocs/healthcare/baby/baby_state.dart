part of 'baby_bloc.dart';

abstract class BabyState extends Equatable {
  @override
  List<Object> get props => [];
}

class BabyInitial extends BabyState {}

class BabyLoading extends BabyState {}

class BabySuccess extends BabyState {}

class SearchBabySuccess extends BabyState {
  final List<HealthCare> babyProducts;
  SearchBabySuccess({@required this.babyProducts});
  @override
  List<Object> get props => [babyProducts];
}

class FetchBabySuccess extends BabyState {
  final List<HealthCare> babyProducts;
  FetchBabySuccess({@required this.babyProducts});
  @override
  List<Object> get props => [babyProducts];
}

class BabyFailure extends BabyState {
  final String message;

  BabyFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
