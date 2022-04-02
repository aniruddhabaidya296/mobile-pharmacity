// ignore_for_file: prefer_const_constructors, avoid_single_cascade_in_expression_statements, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:pharmacity/blocs/bloc.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/dao/login_dao.dart';
import 'package:pharmacity/global_handlers/global_constants.dart';
import 'package:pharmacity/ui/home/home_screen.dart';
import 'package:pharmacity/widgets/overlay_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPhone extends StatefulWidget {
  final String phoneNumber;
  const VerifyPhone({Key key, this.phoneNumber}) : super(key: key);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String otp;
  String verificationId;
  String errorMessage;
  LoginBloc loginBloc;
  Color color = COLORS.deepBlue;
  bool isInvalid = false;
  bool timeUp = false;
  FocusNode _pinPutFocusNode = FocusNode();
  TextEditingController _pinPutController = TextEditingController();

  BoxDecoration pinPutDecoration = BoxDecoration(
    color: COLORS.secordary,
    borderRadius: BorderRadius.circular(5.0),
  );

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
    startTimer();
  }

  Timer timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoaderOverlay(
      overlayColor: overlayColor,
      useDefaultLoading: false,
      overlayWidget: loaderOverlay,
      overlayOpacity: overlayOpacity,
      child: BlocListener(
        bloc: loginBloc,
        listener: (context, state) {
          if (state is OtpSent) {
            customLog("Otp Sent..");
            setState(() {
              verificationId = state.verificationId;
            });
            context.loaderOverlay.hide();
          } else if (state is LoginSuccess) {
            customLog("Successful login..");
            context.loaderOverlay.hide();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => AuthenticationBloc(),
                    ),
                    BlocProvider(
                      create: (context) =>
                          MedicineBloc()..add(FetchAllMedicines()),
                    ),
                    BlocProvider(
                      create: (context) => MenBloc()..add(FetchAllMens()),
                    ),
                    BlocProvider(
                      create: (context) => WomenBloc()..add(FetchAllWomens()),
                    ),
                    BlocProvider(
                      create: (context) => ElderBloc()..add(FetchAllElders()),
                    ),
                    BlocProvider(
                      create: (context) => BabyBloc()..add(FetchAllBabys()),
                    )
                  ],
                  child: Home(),
                ),
              ),
            );
            // return Home();
          } else if (state is LoginLoading) {
            context.loaderOverlay.show();
          } else if (state is LoginFailure) {
            customLog("Login Failed..");
            context.loaderOverlay.hide();
            if (state.message.contains('invalid-verification-code')) {
              setState(() {
                // errorMessage = state.message;
                isInvalid = true;
              });
            }
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                height: SizeConfig.screenHeight,
                padding: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 12, left: 10, right: 10),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "We have sent a verification code to",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: SizeConfig.blockWidth * 4.2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      child: Text(
                        widget.phoneNumber.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: SizeConfig.blockWidth * 4,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: SizeConfig.blockHeight * 1,
                    ),
                    PinPut(
                      useNativeKeyboard: true,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      withCursor: true,
                      fieldsCount: 6,
                      fieldsAlignment: MainAxisAlignment.spaceAround,
                      textStyle: TextStyle(
                          fontSize: SizeConfig.blockWidth * 4.2,
                          color: Colors.black,
                          fontFamily: 'Visby',
                          fontWeight: FontWeight.bold),
                      eachFieldMargin: EdgeInsets.all(0),
                      eachFieldWidth: SizeConfig.blockWidth * 12,
                      eachFieldHeight: SizeConfig.blockHeight * 8,
                      onSubmit: (pin) {
                        customLog("Completed: " + pin);
                        setState(() {
                          otp = pin;
                        });
                        // Navigator.pushNamed(context, '/home');
                      },

                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      cursor: SizedBox(
                        height: 0,
                        width: 0,
                      ),

                      submittedFieldDecoration: pinPutDecoration.copyWith(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 3),
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: COLORS.deepBlue,
                        ),
                      ),
                      selectedFieldDecoration: pinPutDecoration.copyWith(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 3),
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: COLORS.primary,
                        ),
                      ),
                      followingFieldDecoration: pinPutDecoration.copyWith(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 3),
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: Colors.blue,
                        ),
                      ),
                      pinAnimationType: PinAnimationType.scale,
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 2,
                    ),
                    MaterialButton(
                      disabledColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 2),
                      ),
                      onPressed: () {
                        if (LoginDao.verificationId != null) {
                          loginBloc.add(VerifyOtp(otp: otp));
                        } else {
                          null;
                        }
                      },
                      color: COLORS.primary,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: COLORS.white),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 2,
                    ),
                    Container(
                      child: (_start != 0)
                          ? (errorMessage != null)
                              ? Text(
                                  errorMessage,
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockWidth * 3.5,
                                      color: COLORS.red,
                                      fontWeight: FontWeight.bold),
                                )
                              : isInvalid
                                  ? Text(
                                      "The OTP entered is invalid. Please try again.",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockWidth * 3.5,
                                          color: COLORS.red,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    )
                          : (errorMessage != null)
                              ? Text(
                                  errorMessage,
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockWidth * 3.5,
                                      color: COLORS.red,
                                      fontWeight: FontWeight.bold),
                                )
                              : Text(
                                  "Otp timed out. Please resend",
                                  style: TextStyle(
                                      fontSize: SizeConfig.blockWidth * 3.5,
                                      color: COLORS.red,
                                      fontWeight: FontWeight.bold),
                                ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Container(
                      child: Text(
                        _start.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: SizeConfig.blockWidth * 4.2,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Didnt receive code?',
                          style: TextStyle(
                              // fontFamily: 'Visby',
                              color: COLORS.black,
                              fontSize: SizeConfig.blockWidth * 4.2,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            if (_start == 0) {
                              loginBloc.add(ResendOtp(
                                  phoneNumber: GlobalConstants.phoneNumber));
                              setState(() {
                                errorMessage = null;
                                _start = 60;
                                isInvalid = false;
                                startTimer();
                              });
                            } else {
                              null;
                            }
                          },
                          child: Text(
                            ' Resend Now',
                            style: TextStyle(
                                // fontFamily: 'Visby',
                                color: _start > 0
                                    ? COLORS.greyLight
                                    : COLORS.darkBlue,
                                fontSize: SizeConfig.blockWidth * 4.2,
                                fontWeight: _start > 0
                                    ? FontWeight.w400
                                    : FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 9,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
