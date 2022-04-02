import 'package:flutter/material.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';

const double overlayOpacity = 1;
const Color overlayColor = COLORS.secordary;
Widget loaderOverlay = SizedBox(
  height: SizeConfig.screenHeight,
  child: Center(
    child: SizedBox(
      height: SizeConfig.blockHeight * 10,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        shadowColor: Colors.black,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 5),
        ),
        child: Image.asset("assets/images/disc.gif"),
      ),
    ),
  ),
);
