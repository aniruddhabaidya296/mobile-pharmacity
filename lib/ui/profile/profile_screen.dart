// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: COLORS.primary,
        title: Text(
          "My Account",
          style: TextStyle(fontFamily: "Mulish", fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight * 0.76,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 3),
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockWidth * 3)),
                // height: SizeConfig.blockHeight * 10,
                width: SizeConfig.blockWidth * 85,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: textFieldDecoration("Name"),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockWidth * 3)),
                // height: SizeConfig.blockHeight * 10,
                width: SizeConfig.blockWidth * 85,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: textFieldDecoration("Mobile Number"),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockWidth * 3)),
                // height: SizeConfig.blockHeight * 10,
                width: SizeConfig.blockWidth * 85,
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: textFieldDecoration("Email ID"),
                ),
              ),
              Spacer(),
              Container(
                clipBehavior: Clip.hardEdge,
                height: SizeConfig.blockHeight * 7,
                width: SizeConfig.blockWidth * 85,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockWidth * 3)),
                child: MaterialButton(
                  color: COLORS.primary,
                  child: Text(
                    "Update",
                    style: TextStyle(
                        color: COLORS.white,
                        fontFamily: "Roboto",
                        fontSize: SizeConfig.blockWidth * 4),
                  ),
                  onPressed: () {
                    // Navigator.pop(context);
                    // Navigator.pushNamed(context, '/my_account');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(String label) {
    return InputDecoration(
        // prefixIcon: SizedBox(width: SizeConfig.blockWidth * 2),
        errorStyle:
            TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockWidth * 4,
            horizontal: SizeConfig.blockWidth * 4),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.5),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.5),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.5),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.4),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.5),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
        ),
        labelStyle: TextStyle(
            fontFamily: "Mulish",
            // fontWeight: FontWeight.bold,
            color: COLORS.primary,
            fontSize: SizeConfig.blockWidth * 4.5),
        labelText: label);
  }
}
