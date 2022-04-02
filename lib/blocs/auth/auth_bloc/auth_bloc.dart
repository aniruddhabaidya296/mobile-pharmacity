// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharmacity/config.dart';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/global_handlers/global_constants.dart';
import 'package:pharmacity/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationCheck) {
      yield* _mapAuthenticationCheckToState(event);
    }
    if (event is AuthenticationLoggedIn) {
      yield* _mapAuthenticationLoggedInToState(event);
    }
    if (event is AuthenticationLogout) {
      yield* _mapAuthenticationLogoutToState(event);
    }
  }

  Stream<AuthenticationState> _mapAuthenticationCheckToState(
      AuthenticationCheck event) async* {
    yield AuthenticationLoading();
    try {
      customLog("Authentication bloc hit...");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString("UserId") ?? "";
      GlobalConstants.phoneNumber = prefs.getString("PhoneNumber") ?? "";
      Config.userId = token;
      customLog(
          "UserId: ${Config.userId}, PhoneNumber: ${GlobalConstants.phoneNumber}");
      // customLog(token);

      if (token.isNotEmpty) {
        customLog("Authentication token not empty...");
        yield AuthenticationSuccess();
      } else {
        yield AuthenticationFailed();
      }
    } catch (e) {
      yield AuthenticationError(
          message: 'An unknown error occurred. Error: $e');
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoggedInToState(
      AuthenticationLoggedIn event) async* {
    yield AuthenticationSuccess();
  }

  Stream<AuthenticationState> _mapAuthenticationLogoutToState(
      AuthenticationLogout event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("UserId");

    customLog("Authentication token disposed");
    Config.userId = '';
    yield AuthenticationInitial();
  }
}
