// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/home.dart';
import 'package:pharmacity/model/medicine.dart';

import '../home/home_screen.dart';

class CartListItem extends StatefulWidget {
  final Medicine medicine;
  const CartListItem({Key key, this.medicine}) : super(key: key);

  @override
  _CartListItemState createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Card(
      margin: EdgeInsets.only(top: SizeConfig.blockWidth * 4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3)),
      elevation: SizeConfig.blockWidth * 2,
      child: Container(
        // color: Colors.amber,
        padding: EdgeInsets.only(
            bottom: SizeConfig.blockHeight * 1,
            top: SizeConfig.blockHeight * 1,
            left: SizeConfig.blockWidth * 2),
        width: SizeConfig.screenWidth * 0.9,
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(19),
                        child: Image.network(
                          widget.medicine.imageUrl,
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          height: 20 * SizeConfig.blockWidth,
                          width: 20 * SizeConfig.blockWidth,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    // width: SizeConfig.blockWidth * 55,
                    // height: 132 * ScreenSize.heightMultiplyingFactor,
                    height: SizeConfig.blockHeight * 16,
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 2),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 2,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: ScreenSize.widthMultiplyingFactor * 160,
                              child: Text(
                                widget.medicine.name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize:
                                      ScreenSize.widthMultiplyingFactor * 12,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: SizeConfig.blockHeight * 1,
                        // ),
                        Container(
                          width: ScreenSize.widthMultiplyingFactor * 150,
                          child: Text(
                            widget.medicine.shortComposition,
                            // maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: COLORS.greyMediumLight,
                              fontSize: ScreenSize.widthMultiplyingFactor * 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: SizeConfig.blockHeight * 2,
                        // ),
                        Container(
                          child: Text(
                            '\u20b9${widget.medicine.unitPrice}',
                            style: TextStyle(
                                fontSize: SizeConfig.blockWidth * 3,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          height: SizeConfig.blockHeight * 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: ScreenSize.widthMultiplyingFactor * 130,
                                child: Text(
                                  "${widget.medicine.manufacturerName}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize:
                                        ScreenSize.widthMultiplyingFactor * 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              // Spacer(),
                              MaterialButton(
                                minWidth: SizeConfig.blockWidth * 18,
                                height: ScreenSize.heightMultiplyingFactor * 22,
                                padding: EdgeInsets.only(
                                    bottom:
                                        ScreenSize.heightMultiplyingFactor * 3),
                                color: COLORS.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 1),
                                  side: BorderSide(
                                      color: COLORS.purpleDark,
                                      width: SizeConfig.blockWidth * 0.5),
                                ),
                                onPressed: () async {},
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "-   1   +",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: COLORS.white,
                                          fontSize: SizeConfig.blockWidth * 4.2,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
