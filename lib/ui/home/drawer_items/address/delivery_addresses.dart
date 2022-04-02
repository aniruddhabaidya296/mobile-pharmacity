// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/address.dart';

import 'add_address.dart';

class DeliveryAddresses extends StatefulWidget {
  const DeliveryAddresses({Key key}) : super(key: key);

  @override
  _DeliveryAddressesState createState() => _DeliveryAddressesState();
}

class _DeliveryAddressesState extends State<DeliveryAddresses> {
  TextStyle styleText = TextStyle(
      color: COLORS.greyDark,
      // letterSpacing: 0.1,
      // fontFamily: "Varela",
      fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLORS.primary,
        title: Text(
          "Saved Addresses",
          style: TextStyle(color: COLORS.white, fontFamily: "Varela"),
        ),
        centerTitle: true,
      ),
      backgroundColor: COLORS.offWhite,
      body: Container(
        child: Column(
          children: [
            ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 2,
                  vertical: SizeConfig.blockHeight * 2),
              itemCount: addresses.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(SizeConfig.blockWidth * 2),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1,
                        horizontal: SizeConfig.blockWidth * 2),
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 2,
                        vertical: SizeConfig.blockHeight * 1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(addresses[i].addressLine1, style: styleText),
                        // Text(addresses[i].addressLine2, style: styleText),
                        // Text(addresses[i].landmark, style: styleText),
                        Text(
                            "${addresses[i].addressLine1},${addresses[i].addressLine2},${addresses[i].landmark}",
                            style: TextStyle(
                                color: COLORS.greyMedium,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: SizeConfig.blockHeight * 1,
                        ),
                        Row(
                          children: [
                            Text(
                              "PIN: ",
                              style: TextStyle(
                                  color: COLORS.greyLight,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              addresses[i].pincode,
                              style: TextStyle(
                                  color: COLORS.greyMedium,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Container(
            //   clipBehavior: Clip.hardEdge,
            //   height: SizeConfig.blockHeight * 7,
            //   width: SizeConfig.blockWidth * 85,
            //   decoration: BoxDecoration(
            //       borderRadius:
            //           BorderRadius.circular(SizeConfig.blockWidth * 3)),
            //   child: MaterialButton(
            //     color: COLORS.primary,
            //     child: Text(
            //       "Add Address",
            //       style: TextStyle(
            //           color: COLORS.white,
            //           fontFamily: "Roboto",
            //           fontSize: SizeConfig.blockWidth * 4),
            //     ),
            //     onPressed: () {
            //       // Navigator.pop(context);
            //       // Navigator.pushNamed(context, '/my_account');
            //     },
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: COLORS.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddAddress(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: COLORS.white,
        ),
      ),
    );
  }
}
