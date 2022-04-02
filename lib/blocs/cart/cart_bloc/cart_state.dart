part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class FetchCartSuccess extends CartState {
  List<Medicine> medicines = [];
  FetchCartSuccess({@required this.medicines});

  @override
  List<Object> get props => [medicines];
}

class CartSuccess extends CartState {}

class CartFailure extends CartState {
  final String message;

  CartFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
