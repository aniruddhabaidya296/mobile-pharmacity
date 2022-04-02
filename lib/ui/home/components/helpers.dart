// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/home.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:pharmacity/ui/home/components/product_card.dart';

import '../home_screen.dart';

List<Widget> medicineWidgets = [];

Widget getPicture({HomeModel homeModel}) {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.blockWidth * 4),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 4)),
        // height: SizeConfig.blockHeight * 60,
        child: Image.asset(
          homeModel.url,
          fit: BoxFit.fitHeight,
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.blockHeight * 5,
              horizontal: SizeConfig.blockWidth * 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.blockWidth * 51,
                    child: Text(
                      homeModel.title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: COLORS.white,
                          fontSize: SizeConfig.blockWidth * 7,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                  Container(
                    width: SizeConfig.blockWidth * 51,
                    child: Text(
                      homeModel.subtitle,
                      style: TextStyle(
                          color: COLORS.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                ],
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockWidth * 70),
                  ),
                ),
                color: COLORS.greyLight.withOpacity(0.5),
                margin: EdgeInsets.only(right: SizeConfig.blockWidth * 1),
                child: Container(
                  margin: EdgeInsets.all(SizeConfig.blockWidth * 1),
                  child: FloatingActionButton(
                    backgroundColor: COLORS.greyLight.withOpacity(0.8),
                    onPressed: () {},
                    child: Icon(
                      Icons.favorite_border, //Ionicons.md_heart,
                      size: SizeConfig.blockWidth * 8,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}

Widget getPopularProperties({HomeModel homeModel}) {
  return Stack(
    alignment: Alignment.bottomLeft,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: SizeConfig.blockWidth * 4),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 4)),
        height: SizeConfig.blockHeight * 26,
        width: SizeConfig.screenWidth,
        child: Image.asset(
          homeModel.url,
          fit: BoxFit.cover,
        ),
      ),
      Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          margin: EdgeInsets.symmetric(
              vertical: SizeConfig.blockHeight * 3,
              horizontal: SizeConfig.blockWidth * 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // width: SizeConfig.blockWidth * 51,
                    child: Text(
                      homeModel.title,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: COLORS.white,
                          fontSize: SizeConfig.blockWidth * 7,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 1,
                  ),
                  Container(
                    width: SizeConfig.blockWidth * 51,
                    child: Text(
                      homeModel.subtitle,
                      style: TextStyle(
                          color: COLORS.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockHeight * 2,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget subheading({String text, bool seemore = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(
                fontSize: SizeConfig.blockWidth * 4,
                color: COLORS.greyMediumLight,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        child: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            seemore ? "see more" : "",
            style: TextStyle(
                fontSize: SizeConfig.blockWidth * 3.5,
                color: COLORS.primary,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  );
}

SizedBox box() {
  return SizedBox(
    height: SizeConfig.blockHeight * 2,
  );
}
