import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/home.dart';

Widget getNearbyPlaces({HomeModel homeModel}) {
  return Stack(
    children: [
      Container(
        clipBehavior: Clip.hardEdge,
        height: SizeConfig.blockHeight * 30,
        width: SizeConfig.blockWidth * 45,
        margin: EdgeInsets.only(right: SizeConfig.blockWidth * 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 4),
        ),
        child: Image.asset(
          homeModel.url,
          fit: BoxFit.cover,
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: SizeConfig.blockWidth * 45,
          height: SizeConfig.blockHeight * 6,
          alignment: Alignment.center,
          color: Colors.white.withOpacity(0.8),
          child: Text(
            homeModel.title,
            style: TextStyle(fontSize: SizeConfig.blockWidth * 4),
          ),
        ),
      ),
      Positioned(
        right: SizeConfig.blockWidth * 8,
        top: SizeConfig.blockHeight * 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
          ),
          padding: EdgeInsets.all(SizeConfig.blockWidth * 2),
          alignment: Alignment.center,
          child: Text(
            "\$${homeModel.price}",
            style: TextStyle(fontSize: SizeConfig.blockWidth * 3),
          ),
        ),
      )
    ],
  );
}
