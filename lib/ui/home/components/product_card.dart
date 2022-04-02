// ignore_for_file: prefer_if_null_operators, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/healthcare.dart';
import 'package:pharmacity/model/medicine.dart';

import 'helpers.dart';

Container itemCard({Medicine medicine, bool added, VoidCallback onClick}) {
  return Container(
    // color: Colors.red,
    // height: SizeConfig.blockHeight * 2  0,
    margin: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 1),
    width: SizeConfig.blockWidth * 35,
    child: InkWell(
      onTap: onClick,
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: 5,
            intensity: 5,
            shape: NeumorphicShape.flat,
            color: COLORS.white),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 1,
                    horizontal: SizeConfig.blockWidth * 3),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.blockWidth * 3),
                      bottomRight: Radius.circular(SizeConfig.blockWidth * 3),
                    ) // green shaped
                    ),
                child: Text(
                  "10% OFF",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: COLORS.greyMedium,
                      fontSize: SizeConfig.blockWidth * 3,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: SizeConfig.blockHeight * 3,
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockHeight * 4),
                    alignment: Alignment.center,
                    child: Image.network(
                      medicine.imageUrl != null
                          ? medicine.imageUrl
                          : "https://res.cloudinary.com/du8msdgbj/image/upload/a_ignore,w_380,h_380,c_fit,q_auto,f_auto/v1530272405/iollsbzvezoughzode1a.jpg",
                      // height: SizeConfig.blockHeight * 24,
                      fit: BoxFit.contain,
                      width: SizeConfig.blockWidth * 21,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: SizeConfig.blockWidth * 18,
                          width: SizeConfig.blockWidth * 18,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: COLORS.deepBlue,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Divider(
                  //   thickness: 2,
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1),
                    width: SizeConfig.blockWidth * 50,
                    child: Text(
                      medicine.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockWidth * 3,
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // color: Colors.red,
                        // alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "MRP \u{20B9}${medicine.unitPrice}",
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: "Roboto",
                                  color: COLORS.greyLight,
                                  fontSize: SizeConfig.blockWidth * 2.5),
                            ),
                            Text(
                              "MRP \u{20B9}${medicine.unitPrice.toInt() - medicine.unitPrice.toInt() * 0.1}",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: COLORS.greyLight,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.blockWidth * 3),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        height: SizeConfig.blockHeight * 5.2,
                        child: added
                            ? Container(
                                decoration: BoxDecoration(
                                  color: COLORS.offWhite,
                                  border: Border.all(color: COLORS.green),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 2.3),
                                ),
                                width: SizeConfig.blockWidth * 17,
                                height: SizeConfig.blockHeight * 5.2,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Text(
                                        " -",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockWidth * 6),
                                      ),
                                    ),
                                    Text(
                                      "  1  ",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockWidth * 5),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "+ ",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockWidth * 6),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : MaterialButton(
                                padding: EdgeInsets.zero,
                                minWidth: SizeConfig.blockWidth * 11,
                                height: SizeConfig.blockHeight * 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 2),
                                ),
                                onPressed: () {},
                                color: Colors.green,
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: COLORS.secordary,
                                    fontSize: SizeConfig.blockWidth * 3,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Container healthCareItem(
    {HealthCare healthCare, VoidCallback onClick, bool added = false}) {
  return Container(
    // color: Colors.red,
    // height: SizeConfig.blockHeight * 2  0,
    width: SizeConfig.blockWidth * 35,
    child: InkWell(
      onTap: onClick,
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: 5,
            intensity: 5,
            shape: NeumorphicShape.flat,
            color: COLORS.white),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.blockHeight * 1,
                    horizontal: SizeConfig.blockWidth * 3),
                decoration: BoxDecoration(
                    color: COLORS.pinkExtraLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.blockWidth * 3),
                      bottomRight: Radius.circular(SizeConfig.blockWidth * 3),
                    ) // green shaped
                    ),
                child: Text(
                  "10% OFF",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      color: COLORS.greyMedium,
                      fontSize: ScreenSize.heightMultiplyingFactor * 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // SizedBox(
                  //   height: SizeConfig.blockHeight * 3,
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockHeight * 4),
                    alignment: Alignment.center,
                    child: Image.network(
                      healthCare.skuId != null
                          ? "https://ik.imagekit.io/pharmacity/HealthcareProducts/${healthCare.skuId}.png?updatedAt=1624567318987"
                          : "https://res.cloudinary.com/du8msdgbj/image/upload/a_ignore,w_380,h_380,c_fit,q_auto,f_auto/v1530272405/iollsbzvezoughzode1a.jpg",
                      height: SizeConfig.blockHeight * 12,
                      fit: BoxFit.contain,
                      // width: SizeConfig.blockWidth * 21,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: SizeConfig.blockWidth * 18,
                          width: SizeConfig.blockWidth * 18,
                          child: Center(
                            child: CircularProgressIndicator(
                              backgroundColor: COLORS.deepBlue,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Divider(
                  //   thickness: 2,
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1),
                    // width: SizeConfig.blockWidth * ,
                    child: Text(
                      healthCare.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockWidth * 3,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        // color: Colors.red,
                        // alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\u{20B9}${healthCare.price}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: "Roboto",
                                  color: COLORS.greyLight,
                                  fontSize: SizeConfig.blockWidth * 2.5),
                            ),
                            SizedBox(
                              width: ScreenSize.widthMultiplyingFactor * 60,
                              child: Text(
                                "\u{20B9}${healthCare.price.toInt() - healthCare.price.toInt() * 0.1}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    color: COLORS.greyLight,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockWidth * 3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        // height: SizeConfig.blockHeight * 5.2,
                        child: added
                            ? Container(
                                decoration: BoxDecoration(
                                  color: COLORS.offWhite,
                                  border: Border.all(color: COLORS.green),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 2.3),
                                ),
                                width: SizeConfig.blockWidth * 17,
                                height: SizeConfig.blockHeight * 5.2,
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      child: Text(
                                        " -",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockWidth * 6),
                                      ),
                                    ),
                                    Text(
                                      "  1  ",
                                      style: TextStyle(
                                          fontSize: SizeConfig.blockWidth * 5),
                                    ),
                                    InkWell(
                                      child: Text(
                                        "+ ",
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.blockWidth * 6),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            // : MaterialButton(
                            //     elevation: 0,
                            //     padding: EdgeInsets.zero,
                            //     minWidth: SizeConfig.blockWidth * 1,
                            //     height: SizeConfig.blockHeight * 4,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(
                            //           SizeConfig.blockWidth * 2),
                            //     ),
                            //     onPressed: () {},
                            //     color: Colors.white,
                            // child: Container(
                            //   margin: EdgeInsets.symmetric(
                            //       horizontal: SizeConfig.blockWidth * 3),
                            //   child: Text(
                            //     "ADD",
                            //     style: TextStyle(
                            //       fontWeight: FontWeight.bold,
                            //       color: COLORS.primary,
                            //       fontSize: SizeConfig.blockWidth * 3,
                            //     ),
                            //   ),
                            //     ),
                            //   ),
                            : Container(
                                margin: EdgeInsets.only(
                                    // bottom: SizeConfig.blockHeight * 1,
                                    right:
                                        ScreenSize.widthMultiplyingFactor * 6),
                                child: Text(
                                  "ADD",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: COLORS.primary,
                                    fontSize: SizeConfig.blockWidth * 3,
                                  ),
                                ),
                              ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
