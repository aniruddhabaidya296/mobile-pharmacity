// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/home.dart';

class HomeDetails extends StatefulWidget {
  final HomeModel homeModel;
  const HomeDetails({Key key, this.homeModel}) : super(key: key);

  @override
  _HomeDetailsState createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.offWhite,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 6,
              vertical: SizeConfig.blockHeight * 4),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockWidth * 4),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.blockWidth * 8),
                    ),
                    height: SizeConfig.blockHeight * 70,
                    child: Image.asset(
                      widget.homeModel.url,
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
                                  widget.homeModel.title,
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
                                  widget.homeModel.subtitle,
                                  style: TextStyle(
                                      color: COLORS.white,
                                      fontWeight: FontWeight.bold),
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
                  ),
                  Positioned(
                    top: SizeConfig.blockHeight * 4,
                    left: SizeConfig.blockWidth * 4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.blockWidth * 5),
                        ),
                      ),
                      color: COLORS.white.withOpacity(0.5),
                      // margin: EdgeInsets.only(right: SizeConfig.blockWidth * 1),
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(SizeConfig.blockWidth * 1),
                        child: FloatingActionButton(
                          mini: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockWidth * 3),
                          ),
                          backgroundColor: COLORS.white.withOpacity(0.8),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: SizeConfig.blockWidth * 1),
                            child: Icon(
                              Icons.arrow_back_ios, //Ionicons.md_heart,
                              color: Colors.blue,
                              size: SizeConfig.blockWidth * 6,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 2),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 6,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockWidth * 3),
                          ),
                          color: COLORS.white,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockWidth * 2,
                                vertical: SizeConfig.blockHeight * 1),
                            child: Icon(
                              Ionicons.md_bed,
                              size: SizeConfig.blockWidth * 8,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.blockWidth * 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bedroom",
                                style: TextStyle(
                                    color: COLORS.greyMediumLight,
                                    fontSize: SizeConfig.blockWidth * 3),
                              ),
                              Text(
                                "${widget.homeModel.bedrooms} rooms",
                                style: TextStyle(
                                    color: COLORS.black,
                                    fontWeight: FontWeight.w900,
                                    fontSize: SizeConfig.blockWidth * 5),
                              )
                            ],
                          ),
                        ),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockWidth * 3),
                          ),
                          color: COLORS.white,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockWidth * 2,
                                vertical: SizeConfig.blockHeight * 1),
                            child: Icon(
                              FontAwesome.shower,
                              size: SizeConfig.blockWidth * 8,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.blockWidth * 25,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bathroom",
                                style: TextStyle(
                                    color: COLORS.greyMediumLight,
                                    fontSize: SizeConfig.blockWidth * 3),
                              ),
                              Text(
                                "${widget.homeModel.bathrooms} rooms",
                                style: TextStyle(
                                    color: COLORS.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: SizeConfig.blockWidth * 5),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockHeight * 2),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at arcu mauris. Vivamus dapibus neque urna, sit amet condimentum velit pulvinar et. Ut hendrerit consequat est, quis bibendum nulla scelerisque sed. Nam pellentesque est lorem, eget pellentesque enim scelerisque ut.",
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: COLORS.greyMediumLight,
                            fontSize: SizeConfig.blockWidth * 4),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockHeight * 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 6),
        height: SizeConfig.blockHeight * 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                      color: COLORS.greyMediumLight,
                      fontSize: SizeConfig.blockWidth * 3),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      "\$${widget.homeModel.price}",
                      style: TextStyle(
                          color: COLORS.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 9),
                    ),
                    Text(
                      "/Month",
                      style: TextStyle(
                          color: COLORS.black,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.blockWidth * 4),
                    ),
                  ],
                ),
              ],
            ),
            MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockHeight * 2,
                  horizontal: SizeConfig.blockWidth * 4),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.blockWidth * 2)),
              onPressed: () {},
              color: COLORS.greyMedium,
              child: Text(
                "Rent Now",
                style: TextStyle(
                    color: COLORS.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.blockWidth * 5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
