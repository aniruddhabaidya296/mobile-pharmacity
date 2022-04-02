// import 'dart:html';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/medicine.dart';

class MedcineListItemWidget extends StatelessWidget {
  final Medicine medicine;

  MedcineListItemWidget({
    this.medicine,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockWidth * 3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 5)),
      elevation: SizeConfig.blockWidth * 2,
      child: Container(
        width: SizeConfig.blockWidth * 86,
        // color: Colors.amber,
        padding: EdgeInsets.only(
            left: SizeConfig.blockWidth * 2,
            top: SizeConfig.blockHeight * 0.8,
            bottom: SizeConfig.blockHeight * 1.3),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(SizeConfig.blockWidth * 4),
                        child: Image.network(
                          (medicine.imageUrl != null)
                              ? medicine.imageUrl
                              : 'https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1240&q=80',
                          fit: BoxFit.cover,
                          height: 100 * ScreenSize.heightMultiplyingFactor,
                          width: 100 * ScreenSize.widthMultiplyingFactor,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Chip(
                        visualDensity:
                            VisualDensity(horizontal: -4, vertical: -4),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight:
                                Radius.circular(SizeConfig.blockWidth * 2),
                            topRight:
                                Radius.circular(SizeConfig.blockWidth * 2),
                          ),
                        ),
                        labelPadding: EdgeInsets.zero,
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: SizeConfig.blockWidth * 3,
                        // ),
                        label: Text(
                          '10% OFF',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ScreenSize.heightMultiplyingFactor * 12,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    padding: EdgeInsets.only(left: SizeConfig.blockWidth * 2),
                    height: SizeConfig.blockHeight * 17,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // color: Colors.amber,
                              // height: ScreenSize.heightMultiplyingFactor * 21,
                              width: SizeConfig.blockWidth * 55,
                              child: Text(
                                medicine.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: SizeConfig.blockWidth * 3,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: ScreenSize.heightMultiplyingFactor * 8,
                        // ),
                        Container(
                          // width: SizeConfig.blockWidth * 40,
                          margin: EdgeInsets.symmetric(
                              vertical: ScreenSize.heightMultiplyingFactor * 8),
                          child: Text(
                            medicine.packSizeLabel,
                            // maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: COLORS.greyLight,
                              fontSize: SizeConfig.blockWidth * 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: SizeConfig.blockHeight * 5,
                        // ),
                        Container(
                          // height: SizeConfig.blockHeight * 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\u20B9${medicine.unitPrice.toString()}",
                                style: TextStyle(
                                  color: COLORS.greyLight,
                                  fontSize: SizeConfig.blockWidth * 3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: SizeConfig.blockWidth * 35,
                              child: Text(
                                medicine.shortComposition,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: COLORS.greyLight,
                                  fontSize: SizeConfig.blockWidth * 3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockWidth * 4,
                              ),
                              child: MaterialButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 1.5),
                                ),
                                // height: SizeConfig.blockHeight * 4,
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      ScreenSize.heightMultiplyingFactor * 5,
                                ),
                                color: COLORS.deepBlue,
                                height: SizeConfig.blockHeight * 0.5,
                                minWidth: SizeConfig.blockWidth * 15,
                                onPressed: () {},
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.blockWidth * 2,
                                    vertical:
                                        ScreenSize.heightMultiplyingFactor * 5,
                                  ),
                                  child: Text(
                                    "ADD",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize:
                                          ScreenSize.heightMultiplyingFactor *
                                              11,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              thickness: SizeConfig.blockHeight * 0.2,
              height: ScreenSize.heightMultiplyingFactor * 16,
              color: COLORS.greyLight,
            ),
            // SizedBox(height: ScreenSize.heightMultiplyingFactor * 3),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 3),
              // color: Colors.red,
              // width: SizeConfig.blockWidth * 92,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Manufacturer: ",
                    style: TextStyle(
                        fontSize: SizeConfig.blockWidth * 3,
                        color: COLORS.greyMediumLight),
                  ),
                  Text(
                    medicine.manufacturerName,
                    style: TextStyle(
                        fontSize: SizeConfig.blockWidth * 3,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
