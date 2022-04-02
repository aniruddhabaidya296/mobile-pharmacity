// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_responsiveness/flutter_responsiveness.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharmacity/blocs/healthcare/baby/baby_bloc.dart';
import 'package:pharmacity/blocs/healthcare/elder/elder_bloc.dart';
import 'package:pharmacity/blocs/healthcare/men/men_bloc.dart';
import 'package:pharmacity/blocs/healthcare/women/women_bloc.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/global_handlers/global_bloc_class.dart';
import 'package:pharmacity/model/healthcare.dart';
import 'package:pharmacity/model/home.dart';
import 'package:pharmacity/ui/home/components/drawer_helper.dart';
import 'package:pharmacity/ui/home/home_details.dart';
import 'package:pharmacity/widgets/overlay_widget.dart';
import 'package:pharmacity/widgets/sroll_to_hide_widget.dart';
import 'package:pharmacity/blocs/bloc.dart';
import 'components/helpers.dart';
import 'components/list_item.dart';
import 'components/product_card.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  MedicineBloc medicineBloc;
  MenBloc menBloc;
  WomenBloc womenBloc;
  ElderBloc elderBloc;
  BabyBloc babyBloc;
  AuthenticationBloc authenticationBloc;

  TextEditingController searchController = TextEditingController();
  InputDecoration _inputDecoration = InputDecoration(
    suffixIcon: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
      ),
      color: COLORS.primary,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 1,
            vertical: SizeConfig.blockHeight * 1),
        child: Icon(
          Icons.filter_list_outlined,
          size: SizeConfig.blockWidth * 6,
          color: COLORS.white,
        ),
      ),
    ),
    prefixIcon: Icon(
      AntDesign.search1,
      color: COLORS.greyMediumLight,
      size: SizeConfig.blockWidth * 7,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 7),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 7),
      borderSide: BorderSide(color: Colors.transparent),
      // borderSide: BorderSide(color: COLORS.skyBlueLightest),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 7),
      borderSide: BorderSide(color: Colors.transparent),
      // borderSide: BorderSide(color: COLORS.skyBlueLightest),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: SizeConfig.blockHeight * 2),
    isDense: true,
    hintStyle: TextStyle(
        color: COLORS.greyMediumLight,
        letterSpacing: 0.5,
        fontSize: SizeConfig.blockWidth * 4),
    hintText: "Search Medicines",
  );
  List<Widget> homePosts = [];
  @override
  void initState() {
    super.initState();
    for (var i in homes) {
      homePosts.add(
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
          child: getPicture(homeModel: i),
        ),
      );
    }
    medicineBloc = BlocProvider.of<MedicineBloc>(context);
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    menBloc = BlocProvider.of<MenBloc>(context);
    womenBloc = BlocProvider.of<WomenBloc>(context);
    babyBloc = BlocProvider.of<BabyBloc>(context);
    elderBloc = BlocProvider.of<ElderBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LoaderOverlay(
      overlayColor: overlayColor,
      useDefaultLoading: false,
      overlayWidget: loaderOverlay,
      overlayOpacity: overlayOpacity,
      child: BlocBuilder(
        bloc: medicineBloc,
        builder: (context, state) {
          if (state is FetchMedicinesSuccess) {
            GlobalBlocClass.medicines = state.medicines;
            context.loaderOverlay.hide();
            return Scaffold(
              key: _scaffoldKey,
              drawer: drawerHelper(context, authenticationBloc),
              backgroundColor: COLORS.offWhite,
              appBar: AppBar(
                leading: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(Icons.menu),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockWidth * 4),
                    icon: Icon(
                      Icons.notifications,
                      color: COLORS.secordary,
                    ),
                  )
                ],
                automaticallyImplyLeading: false,
                backgroundColor: COLORS.primary,
                title: Text(
                  "Pharmacity",
                  style: TextStyle(color: COLORS.secordary),
                ),
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  // height: SizeConfig.screenHeight * 0.9,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 3),
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),
                      ScrollToHideWidget(
                        controller: controller,
                        child: Container(
                          height: SizeConfig.blockWidth * 13,
                          // margin: EdgeInsets.symmetric(
                          //     vertical: SizeConfig.blockHeight * 2),
                          child: Neumorphic(
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(
                                        SizeConfig.blockWidth * 2)),
                                // depth: 3,
                                lightSource: LightSource.top,
                                // intensity: 2,
                                color: COLORS.secordary),
                            child: TextField(
                              decoration: _inputDecoration,
                              controller: searchController,
                              onChanged: (text) {
                                // noteBloc.add(SearchNote(word: text));
                              },
                              onSubmitted: (text) {},
                              style: TextStyle(
                                  color: COLORS.black,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.5,
                                  fontSize: SizeConfig.blockWidth * 4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),

                      // SizedBox(
                      //   height: SizeConfig.blockHeight * 1,
                      // ),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockWidth * 4)),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/pcover.jpg",
                          // height: SizeConfig.blockHeight * 12,
                          fit: BoxFit.contain,
                          // width: SizeConfig.blockWidth * 21,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),

                      subheading(text: "Men", seemore: true),
                      SizedBox(
                        height: ScreenSize.heightMultiplyingFactor * 190,
                        // child: Expanded(
                        child: BlocBuilder(
                          bloc: menBloc,
                          builder: (context, state) {
                            if (state is FetchMensSuccess) {
                              GlobalBlocClass.hProducts = state.menProducts;
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenSize.heightMultiplyingFactor *
                                            12),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.menProducts.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.blockWidth * 2),
                                    child: healthCareItem(
                                      healthCare: state.menProducts[i],
                                      added: false,
                                      onClick: () {},
                                    ),
                                  );
                                },
                              );
                            } else if (state is MenLoading) {
                              return SizedBox(
                                height: SizeConfig.blockHeight * 5,
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Container();
                          },
                        ),
                        // ),
                      ),
                      subheading(text: "Women", seemore: true),
                      SizedBox(
                        height: ScreenSize.heightMultiplyingFactor * 190,
                        // child: Expanded(
                        child: BlocBuilder(
                          bloc: womenBloc,
                          builder: (context, state) {
                            if (state is FetchWomensSuccess) {
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenSize.heightMultiplyingFactor *
                                            12),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.womenProducts.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.blockWidth * 2),
                                    child: healthCareItem(
                                      healthCare: state.womenProducts[i],
                                      added: false,
                                      onClick: () {},
                                    ),
                                  );
                                },
                              );
                            } else if (state is WomenLoading) {
                              return SizedBox(
                                  height: SizeConfig.blockHeight * 5,
                                  child: CircularProgressIndicator());
                            }
                            return Container();
                          },
                        ),
                        // ),
                      ),
                      subheading(text: "Elders", seemore: true),
                      SizedBox(
                        height: ScreenSize.heightMultiplyingFactor * 190,
                        // child: Expanded(
                        child: BlocBuilder(
                          bloc: elderBloc,
                          builder: (context, state) {
                            if (state is FetchEldersSuccess) {
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenSize.heightMultiplyingFactor *
                                            12),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.elderProducts.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.blockWidth * 2),
                                    child: healthCareItem(
                                      healthCare: state.elderProducts[i],
                                      added: false,
                                      onClick: () {},
                                    ),
                                  );
                                },
                              );
                            } else if (state is WomenLoading) {
                              return CircularProgressIndicator();
                            }
                            return Container();
                          },
                          // ),
                        ),
                      ),
                      subheading(text: "Children", seemore: true),
                      SizedBox(
                        height: ScreenSize.heightMultiplyingFactor * 190,
                        // child: Expanded(
                        child: BlocBuilder(
                          bloc: babyBloc,
                          builder: (context, state) {
                            if (state is FetchBabySuccess) {
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                    vertical:
                                        ScreenSize.heightMultiplyingFactor *
                                            12),
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: state.babyProducts.length,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.blockWidth * 2),
                                    child: healthCareItem(
                                      healthCare: state.babyProducts[i],
                                      added: false,
                                      onClick: () {},
                                    ),
                                  );
                                },
                              );
                            } else if (state is WomenLoading) {
                              return CircularProgressIndicator();
                            }
                            return Container();
                          },
                        ),
                        // ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),
                      Container(
                        // width: SizeConfig.blockWidth * 60,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Find Your Best Medicines",
                          style: TextStyle(
                              fontSize: SizeConfig.blockWidth * 8,
                              color: COLORS.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 3,
                      ),
                      subheading(text: "Popular Products", seemore: true),
                      // GridView.builder(
                      //   physics: BouncingScrollPhysics(),
                      //   padding: EdgeInsets.symmetric(
                      //       horizontal: SizeConfig.blockWidth * 4,
                      //       vertical: SizeConfig.blockHeight * 3),
                      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //     crossAxisCount: 2,
                      //     crossAxisSpacing: SizeConfig.blockWidth * 4,
                      //     mainAxisSpacing: SizeConfig.blockHeight * 3,
                      //     childAspectRatio: (1.1 / 1.25),
                      //   ),
                      //   shrinkWrap: true,
                      //   itemCount: state.medicines.length,
                      //   itemBuilder: (context, i) {
                      //     return itemCard(
                      //         medicine: state.medicines[i],
                      //         added: false,
                      //         onClick: () {});
                      //   },
                      // ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: state.medicines.length,
                        itemBuilder: (context, i) {
                          return MedcineListItemWidget(
                            medicine: state.medicines[i],
                          );
                        },
                      )
                      // SizedBox(
                      //   height: SizeConfig.blockHeight * 10,
                      // )
                    ],
                  ),
                ),
              ),
              // extendBody: true,
            );
          } else if (state is MedicineLoading) {
            context.loaderOverlay.show();
            return Container();
          }
          return loaderOverlay;
        },
      ),
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
                  color: COLORS.deepBlue,
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
}
