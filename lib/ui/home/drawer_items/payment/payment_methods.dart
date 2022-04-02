// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/ui/home/components/helpers.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
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
        backgroundColor: COLORS.primary,
        title: Text(
          "Payment Methods",
          style: TextStyle(
              fontFamily: "Mulish", fontSize: SizeConfig.blockWidth * 4.7),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              box(),
              Container(
                width: SizeConfig.blockWidth * 90,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Online Payment",
                  style: TextStyle(
                      fontFamily: "Mulish",
                      color: COLORS.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockWidth * 4.5),
                ),
              ),
              _paymentMethodTile(
                  header: "Debit Card",
                  leading: Icon(
                    Icons.credit_card,
                    size: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 0),
              _paymentMethodTile(
                  header: "Credit Card",
                  leading: Icon(
                    Icons.credit_card,
                    size: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 1),
              Container(
                width: SizeConfig.blockWidth * 90,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Wallets",
                  style: TextStyle(
                      fontFamily: "Mulish",
                      color: COLORS.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockWidth * 4.5),
                ),
              ),
              _paymentMethodTile(
                  header: "Paytm Wallet",
                  leading: Image(
                    image: AssetImage("assets/images/paytm.png"),
                    width: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 2),
              _paymentMethodTile(
                  header: "Mobiwik Wallet",
                  leading: Image(
                    image: AssetImage("assets/images/mobikwik.jpg"),
                    width: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 3),
              Container(
                width: SizeConfig.blockWidth * 90,
                alignment: Alignment.centerLeft,
                child: Text(
                  "UPI IDs",
                  style: TextStyle(
                      fontFamily: "Mulish",
                      color: COLORS.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockWidth * 4.5),
                ),
              ),
              _paymentMethodTile(
                  header: "Phone Pe",
                  leading: Image(
                    image: AssetImage("assets/images/phonepe.png"),
                    width: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 4),
              _paymentMethodTile(
                  header: "Google Pay",
                  leading: Image(
                    image: AssetImage("assets/images/googlepay.png"),
                    width: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 5),
              _paymentMethodTile(
                  header: "Mobikwik",
                  leading: Image(
                    image: AssetImage("assets/images/mobikwik.jpg"),
                    width: SizeConfig.blockWidth * 7,
                  ),
                  radioSelected: 6),
              box(),
            ],
          ),
        ),
      ),
    );
  }

  _paymentMethodTile({Widget leading, String header, int radioSelected}) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, '/order_details');
        if (header.contains("Card")) {
          Navigator.pushNamed(context, '/add_card');
        } else if (!header.contains("Wallet")) {
          Navigator.pushNamed(context, '/add_upi');
        }
      },
      child: InkWell(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
          width: SizeConfig.blockWidth * 90,
          height: SizeConfig.blockHeight * 10,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: COLORS.white,
            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          // height: SizeConfig.blockHeight * 5,

          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 4,
              vertical: SizeConfig.blockHeight * 2.5),
          child: Row(
            children: [
              leading,
              SizedBox(
                width: SizeConfig.blockWidth * 3,
              ),
              SizedBox(
                // color: Colors.blue,
                // width: SizeConfig.blockWidth * 60,
                child: Text(
                  header,
                  style: TextStyle(
                      fontFamily: "Mulish",
                      color: COLORS.greyDark,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.blockWidth * 4.5),
                ),
              ),
              Spacer(),
              Radio(
                value: radioSelected,
                groupValue: groupValue,
                activeColor: COLORS.primary,
                toggleable: false,
                focusColor: COLORS.primary,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            groupValue = radioSelected;
          });
        },
      ),
    );
  }
}
