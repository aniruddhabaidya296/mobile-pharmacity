part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchCart extends CartEvent {
  final String userId;

  FetchCart({this.userId});

  @override
  List<Object> get props => [userId];
}

class AddToCart extends CartEvent {
  final Medicine medicine;

  AddToCart({this.medicine});

  @override
  List<Object> get props => [medicine];
}
