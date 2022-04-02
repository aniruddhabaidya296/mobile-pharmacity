part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SubmitButtonPressed extends LoginEvent {
  final String phoneNumber;
  final String smsCode;

  SubmitButtonPressed({this.phoneNumber, this.smsCode});

  @override
  List<Object> get props => [phoneNumber, smsCode];
}

class VerifyOtp extends LoginEvent {
  final String otp;
  VerifyOtp({this.otp});

  @override
  List<Object> get props => [otp];
}

class ResendOtp extends LoginEvent {
  final String phoneNumber;
  ResendOtp({this.phoneNumber});
  @override
  List<Object> get props => [phoneNumber];
}
