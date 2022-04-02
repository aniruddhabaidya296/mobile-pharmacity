part of 'auth_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class AuthenticationCheck extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationLogout extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final User user;

  AuthenticationLoggedIn({@required this.user});

  @override
  List<Object> get props => [user];
}
