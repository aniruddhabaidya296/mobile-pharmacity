// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/ui/home/components/helpers.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  int groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: COLORS.white),
        centerTitle: true,
        backgroundColor: COLORS.green,
        title: Text(
          "Add Card",
          style: TextStyle(
              color: COLORS.white,
              fontFamily: "Raleway",
              fontSize: SizeConfig.blockWidth * 5),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              box(),
              Container(
                width: SizeConfig.blockWidth * 85,
                child: Row(
                  children: [
                    Radio(
                      value: 0,
                      groupValue: groupValue,
                      activeColor: Colors.green,
                      toggleable: true,
                      focusColor: COLORS.primary,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                    Text(
                      "Debit Card",
                      style: TextStyle(
                          fontFamily: "Mulish",
                          color: COLORS.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 4.5),
                    ),
                    SizedBox(
                      width: SizeConfig.blockWidth * 7,
                    ),
                    Radio(
                      value: 1,
                      groupValue: groupValue,
                      activeColor: Colors.green,
                      toggleable: true,
                      focusColor: COLORS.green,
                      onChanged: (value) {
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                    Text(
                      "Credit Card",
                      style: TextStyle(
                          fontFamily: "Mulish",
                          color: COLORS.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 4.5),
                    ),
                  ],
                ),
              ),
              box(),
              Container(
                width: SizeConfig.blockWidth * 85,
                child: TextField(
                  decoration: textFieldDecoration("Card Number"),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberInputFormatter()
                  ],
                  style: TextStyle(
                      fontFamily: "Mulish",
                      fontWeight: FontWeight.w600,
                      color: COLORS.primary,
                      fontSize: SizeConfig.blockWidth * 4.5),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: SizeConfig.blockHeight * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: SizeConfig.blockWidth * 43,
                    child: TextField(
                      decoration: textFieldDecoration("Expiry Date"),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardMonthInputFormatter()
                      ],
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          color: COLORS.primary,
                          fontSize: SizeConfig.blockWidth * 4.5),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockWidth * 35,
                    child: TextField(
                      decoration: textFieldDecoration("CVV"),
                      style: TextStyle(
                          fontFamily: "Mulish",
                          fontWeight: FontWeight.w600,
                          color: COLORS.primary,
                          fontSize: SizeConfig.blockWidth * 4.5),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                      ],
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.blockHeight * 45,
              ),
              Container(
                height: SizeConfig.blockHeight * 7,
                width: SizeConfig.blockWidth * 85,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.blockWidth * 2)),
                  color: COLORS.green,
                  child: Text(
                    "Add Card",
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
            fontFamily: "Mulish",
            fontWeight: FontWeight.w600,
            color: COLORS.primary,
            fontSize: SizeConfig.blockWidth * 4.5),
        labelStyle: TextStyle(
            fontFamily: "Mulish",
            fontWeight: FontWeight.w600,
            color: COLORS.primary,
            fontSize: SizeConfig.blockWidth * 4.5),
        labelText: label);
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
