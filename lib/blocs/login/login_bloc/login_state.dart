part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class OtpSent extends LoginState {
  final String verificationId;
  OtpSent({@required this.verificationId});

  @override
  List<Object> get props => [verificationId];
}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure({@required this.message});

  @override
  List<Object> get props => [message];
}
