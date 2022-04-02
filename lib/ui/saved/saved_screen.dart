// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/model/home.dart';
import 'package:pharmacity/ui/home/components/helpers.dart';
import 'package:pharmacity/ui/home/home_details.dart';

import 'components/helpers.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({Key key}) : super(key: key);

  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<Widget> popularProperties = [];
  @override
  void initState() {
    super.initState();
    for (var i in homes) {
      popularProperties.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetails(
                  homeModel: i,
                ),
              ),
            );
          },
          child: getPopularProperties(homeModel: i),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.offWhite,
      appBar: AppBar(
        backgroundColor: COLORS.primary,
        title: Text(
          "Saved Medicines",
          style: TextStyle(color: COLORS.white, fontFamily: "Varela"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 6),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.blockHeight * 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
