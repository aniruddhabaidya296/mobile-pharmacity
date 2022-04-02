// ignore_for_file: avoid_customLog
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmacity/constants/custom_log.dart';
// import 'package:iota/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

class LoginDao {
  static String verificationId;
  Future checkUser({String phoneNumber}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    var response;
    verificationCompleted(PhoneAuthCredential credential) async {
      Config.userId = auth.currentUser.uid.toString();
      response = jsonEncode({'status': 'Success'});
      return response;
    }

    verificationFailed(FirebaseAuthException e) {
      customLog(e.toString());
      if (e.code == 'invalid-phone-number') {
        customLog('The provided phone number is not valid.');
      }
      response = jsonEncode({'status': e.toString()});
      return response;
    }

    codeSent(String verId, [int forceCodeResend]) async {
      customLog("Entering code sent..");
      verificationId = verId;
      customLog(verificationId);
      response = jsonEncode({'verificationId': verificationId.toString()});
      // customLog("response is $response");
      // return response;
    }

    // ignore: prefer_function_declarations_over_variables
    PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      verificationId = verId;
    };

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        timeout: const Duration(seconds: 60),
        codeSent: codeSent,
        codeAutoRetrievalTimeout: autoRetrieve,
      );
    } catch (e) {
      customLog(e.toString());
      response = jsonEncode({'message': e.toString()});
    }
  }

  resendOtp({String phoneNumber}) {
    checkUser(phoneNumber: phoneNumber);
  }

  Future verifyOTP({String smsOTP}) async {
    var response;
    try {
      FirebaseAuth _auth = FirebaseAuth.instance;
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsOTP,
      );
      await _auth.signInWithCredential(credential).then((authResult) async {
        final User currentUser = _auth.currentUser;
        assert(authResult.user.uid == currentUser.uid);
        Config.userId = authResult.user.uid.toString();
        response = jsonEncode({'status': 'Success'});
        customLog(Config.userId);
      });
      return response;
    } catch (e) {
      customLog(e.toString());
      return jsonEncode({'message': e.toString()});
    }
  }
}
