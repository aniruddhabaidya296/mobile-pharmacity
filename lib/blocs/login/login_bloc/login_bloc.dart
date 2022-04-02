import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/dao/login_dao.dart';
import 'package:pharmacity/global_handlers/global_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    loginDao = LoginDao();
  }

  LoginDao loginDao;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is SubmitButtonPressed) {
      yield* _mapSubmitButtonPressedToState(event);
    } else if (event is VerifyOtp) {
      yield* _mapVerifytOtpToState(event);
    } else if (event is ResendOtp) {
      yield* _mapResendOtpToState(event);
    }
  }

  Stream<LoginState> _mapSubmitButtonPressedToState(
      SubmitButtonPressed event) async* {
    yield LoginLoading();
    try {
      customLog("Submit stream entered...");
      await loginDao.checkUser(phoneNumber: event.phoneNumber);
      Future.delayed(const Duration(seconds: 5));
      customLog(LoginDao.verificationId);
      yield OtpSent(verificationId: LoginDao.verificationId);
    } catch (err) {
      customLog('error is ${err.toString()}');
      yield LoginFailure(message: "Something went wrong");
    }
  }

  Stream<LoginState> _mapVerifytOtpToState(VerifyOtp event) async* {
    yield LoginLoading();
    try {
      var response = await loginDao.verifyOTP(smsOTP: event.otp);
      var jsonDecoded = jsonDecode(response);
      customLog(response.toString());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (jsonDecoded['status'] == 'Success' && Config.userId != null) {
        await prefs.setString('UserId', Config.userId);
        await prefs.setString('PhoneNumber', GlobalConstants.phoneNumber);
        customLog(
            "UserId: ${Config.userId}, PhoneNumber: ${GlobalConstants.phoneNumber}");
        yield LoginSuccess();
      } else {
        yield LoginFailure(message: jsonDecoded['message'].toString());
      }
    } catch (err) {
      customLog("err is ${err.toString()}");
      yield LoginFailure(message: "Something went wrong");
    }
  }

  Stream<LoginState> _mapResendOtpToState(ResendOtp event) async* {
    yield LoginLoading();
    try {
      customLog("Resend stream entered...");
      var response = await loginDao.resendOtp(phoneNumber: event.phoneNumber);
      Future.delayed(const Duration(seconds: 5));
      customLog(LoginDao.verificationId);
      yield OtpSent(verificationId: LoginDao.verificationId);
    } catch (err) {
      yield LoginFailure(message: "Something went wrong");
    }
  }
}
