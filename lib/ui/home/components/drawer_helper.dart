// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:pharmacity/blocs/auth/auth.dart';
import 'package:pharmacity/blocs/bloc.dart';
import 'package:pharmacity/blocs/healthcare/baby/baby_bloc.dart';
import 'package:pharmacity/blocs/healthcare/elder/elder_bloc.dart';
import 'package:pharmacity/blocs/healthcare/men/men_bloc.dart';
import 'package:pharmacity/blocs/healthcare/women/women_bloc.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/global_handlers/global_constants.dart';
import 'package:pharmacity/ui/initial/login.dart';
import 'package:pharmacity/ui/main_screen.dart';

Widget drawerHelper(
    BuildContext context, AuthenticationBloc authenticationBloc) {
  return SafeArea(
    child: Container(
      width: SizeConfig.screenWidth * 0.75,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: SizeConfig.blockHeight * 20,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: COLORS.primary),
                  padding: EdgeInsets.all(SizeConfig.blockWidth * 3),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width: SizeConfig.blockWidth * 1),
                          Container(
                            width: SizeConfig.blockHeight * 9,
                            height: SizeConfig.blockHeight * 9,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/images/image.JPG')),
                            ),
                          ),
                          SizedBox(width: SizeConfig.blockWidth * 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: SizeConfig.blockWidth * 42,
                                child: Text(
                                  "aniruddhabaidya296@gmail.com",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: COLORS.white,
                                    fontFamily: 'Varela',
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        ScreenSize.widthMultiplyingFactor * 12,
                                  ),
                                ),
                              ),
                              SizedBox(height: SizeConfig.blockHeight * 0.5),
                              Container(
                                child: Text(
                                  GlobalConstants.phoneNumber,
                                  style: TextStyle(
                                    color: COLORS.white,
                                    fontFamily: 'Varela',
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        ScreenSize.widthMultiplyingFactor * 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            _listTile(
                icon: AntDesign.appstore1,
                title: 'Categories',
                onPressed: () {
                  Navigator.pushNamed(context, '/shop_by_category');
                }),
            _listTile(
                icon: Icons.location_pin,
                title: 'Delivery Addresses',
                onPressed: () {
                  Navigator.pushNamed(context, '/delivery_addresses');
                }),
            _listTile(
                icon: Icons.history,
                title: 'Order History',
                onPressed: () {
                  Navigator.pushNamed(context, '/my_orders');
                }),
            _listTile(
                icon: Icons.bookmark,
                title: 'Saved Medicines',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MainScreen(selectedTab: SelectedTab.saved),
                    ),
                  );
                }),
            _listTile(
                icon: AntDesign.creditcard,
                title: 'Payment Methods',
                onPressed: () {
                  Navigator.pushNamed(context, '/payment_methods');
                }),

            // _listTile(
            //     icon: AntDesign.tags,
            //     title: 'Offers For You',
            //     onPressed: () {
            //       // Navigator.pushNamed(context, '/UserViewProfileScreen');
            //     }),
            _listTile(
                icon: Icons.live_help_outlined,
                title: 'Support',
                onPressed: () {
                  Navigator.pushNamed(context, '/chat_screen');
                }),
            // _listTile(
            //     icon: Icons.help_outline_sharp,
            //     title: 'FAQ',
            //     onPressed: () {
            //       Navigator.pushNamed(context, '/faq');
            //     }),
            _listTile(
              icon: Icons.logout,
              title: 'Logout',
              onPressed: () {
                authenticationBloc.add(AuthenticationLogout());
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (BuildContext context) => LoginBloc(),
                        child: LoginScreen(),
                      ),
                    ),
                    (Route<dynamic> route) => false);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

ListTile _listTile({IconData icon, String title, VoidCallback onPressed}) {
  return ListTile(
      // contentPadding: EdgeInsets.fromLTRB(
      //     SizeConfig.blockWidth * 3.5,
      //     SizeConfig.blockWidth * 1,
      //     SizeConfig.blockWidth * 4,
      //     SizeConfig.blockWidth * 0),
      dense: true,
      leading: Icon(
        icon,
        color: COLORS.primary,
        size: SizeConfig.blockWidth * 6,
      ),
      horizontalTitleGap: 0,
      title: Text(
        '$title',
        style: TextStyle(
          color: COLORS.darkBlue,
          fontFamily: 'Varela',
          fontSize: SizeConfig.blockWidth * 4.0,
        ),
      ),
      onTap: () => onPressed());
}
