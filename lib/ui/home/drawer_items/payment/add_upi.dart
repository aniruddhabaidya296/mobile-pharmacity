// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';

class AddUpi extends StatefulWidget {
  const AddUpi({Key key}) : super(key: key);

  @override
  _AddUpiState createState() => _AddUpiState();
}

class _AddUpiState extends State<AddUpi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: COLORS.white),
        centerTitle: true,
        backgroundColor: COLORS.primary,
        title: Text(
          "Add UPI ID",
          style: TextStyle(
              color: COLORS.white,
              fontFamily: "Raleway",
              fontSize: SizeConfig.blockWidth * 5),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight * 0.8,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.blockHeight * 5,
              ),
              Container(
                width: SizeConfig.screenWidth * 0.982,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: SizeConfig.blockWidth * 70,
                      child: TextField(
                        decoration: textFieldDecoration("UPI ID"),
                        style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.w600,
                            color: COLORS.primary,
                            fontSize: SizeConfig.blockWidth * 4.5),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 2),
                      ),
                      minWidth: SizeConfig.blockWidth * 18,
                      height: SizeConfig.blockWidth * 13,
                      padding: EdgeInsets.zero,
                      color: COLORS.green,
                      onPressed: () {},
                      child: Text(
                        "Verify",
                        style: TextStyle(
                            color: COLORS.white,
                            fontFamily: "Raleway",
                            fontSize: SizeConfig.blockWidth * 4.5),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Container(
                height: SizeConfig.blockHeight * 7,
                width: SizeConfig.blockWidth * 85,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.blockWidth * 2)),
                  color: COLORS.green,
                  child: Text(
                    "Add UPI ID",
                    style: TextStyle(
                        color: COLORS.white,
                        fontFamily: "Raleway",
                        fontSize: SizeConfig.blockWidth * 4),
                  ),
                  onPressed: () {},
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
        errorStyle:
            TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.symmetric(
            vertical: SizeConfig.blockWidth * 4,
            horizontal: SizeConfig.blockWidth * 4),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.6),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.6),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: COLORS.primary, width: SizeConfig.blockWidth * 0.6),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
        ),
        floatingLabelStyle: TextStyle(
            fontFamily: "Raleway",
            color: COLORS.primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize: SizeConfig.blockWidth * 5),
        labelStyle: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.w600,
            color: COLORS.primary,
            fontSize: SizeConfig.blockWidth * 4.5),
        labelText: label);
  }
}
