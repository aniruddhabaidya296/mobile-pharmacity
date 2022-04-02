part of 'auth_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationFailed extends AuthenticationState {}

// class AuthenticationDashboardAccess extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  AuthenticationSuccess();

  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError({@required this.message});

  @override
  List<Object> get props => [message];
}
