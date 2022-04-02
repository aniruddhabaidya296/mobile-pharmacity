// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:pharmacity/blocs/bloc.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/global_handlers/global_constants.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc loginBloc;
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Scaffold(
        backgroundColor: COLORS.secordary,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.blockHeight * 29,
                ),
                Container(
                  height: SizeConfig.blockHeight * 15,
                  child: Image.asset("assets/images/home.png"),
                ),
                SizedBox(
                  height: SizeConfig.blockHeight * 2,
                ),
                Text(
                  "Pharmacity",
                  style: TextStyle(
                    // color: COLORS.black,
                    color: COLORS.primary,
                    // fontFamily: 'Visby',
                    letterSpacing: 1,
                    fontSize: SizeConfig.blockWidth * 8,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockHeight * 24,
                ),
                Container(
                  height: SizeConfig.blockWidth * 13,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 6),
                  child: Neumorphic(
                    style: NeumorphicStyle(color: COLORS.secordary),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.numberWithOptions(),
                      decoration: textFieldDecoration("Mobile Number"),
                      style: TextStyle(
                          // fontFamily: 'Visby',
                          color: COLORS.black,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.8,
                          fontSize: SizeConfig.blockWidth * 4.3),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockHeight * 3,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockWidth * 3),
                  ),
                  height: SizeConfig.blockHeight * 8,
                  minWidth: SizeConfig.blockWidth * 88,
                  color: COLORS.primary,
                  child: Text(
                    "Get OTP",
                    style: TextStyle(
                        color: COLORS.white,
                        fontSize: SizeConfig.blockWidth * 4),
                  ),
                  onPressed: () {
                    setState(() {
                      GlobalConstants.phoneNumber =
                          '+91' + phoneController.text;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BlocProvider(
                          create: (context) => LoginBloc()
                            ..add(
                              SubmitButtonPressed(
                                  phoneNumber: '+91' + phoneController.text),
                            ),
                          child: VerifyPhone(
                            phoneNumber: GlobalConstants.phoneNumber,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // ),
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(String label) {
    return InputDecoration(
        errorStyle: TextStyle(fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockWidth * 4,
            horizontal: SizeConfig.blockWidth * 4),
        prefixIcon: Icon(
          Icons.phone,
          color: COLORS.deepBlue,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
          borderSide: BorderSide(
            color: COLORS.secordary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
          borderSide: BorderSide(color: COLORS.secordary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
          borderSide: BorderSide(color: COLORS.secordary),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.greyLight, width: SizeConfig.blockWidth * 0.4),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        hintStyle: TextStyle(
            color: COLORS.greyExtraLight, fontSize: SizeConfig.blockWidth * 4),
        hintText: label);
  }
}
