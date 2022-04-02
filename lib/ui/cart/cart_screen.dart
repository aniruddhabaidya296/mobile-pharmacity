// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pharmacity/blocs/bloc.dart';
import 'package:pharmacity/constants/colors.dart';
import 'package:pharmacity/constants/size_config.dart';
import 'package:pharmacity/global_handlers/global_bloc_class.dart';
import 'package:pharmacity/model/home.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:pharmacity/widgets/overlay_widget.dart';

import 'cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  MedicineBloc medicineBloc;
  List<Medicine> medicineList;

  @override
  void initState() {
    super.initState();
    medicineBloc = BlocProvider.of<MedicineBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: medicineBloc,
        builder: (context, state) {
          if (state is MedicineLoading) {
            context.loaderOverlay.show();
          } else if (state is FetchMedicinesSuccess) {
            int sum = 0;
            context.loaderOverlay.hide();
            medicineList = state.medicines;
            for (int i = 0; i < 4; i++) {
              sum = sum + medicineList[i].unitPrice.toInt();
            }
            return LoaderOverlay(
              overlayColor: overlayColor,
              useDefaultLoading: false,
              overlayWidget: loaderOverlay,
              overlayOpacity: overlayOpacity,
              child: Scaffold(
                // backgroundColor: COLORS.offWhite,
                body: Container(
                  margin: EdgeInsets.only(
                      top: SizeConfig.blockHeight * 4,
                      right: SizeConfig.blockWidth * 3,
                      left: SizeConfig.blockWidth * 3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: SizeConfig.blockHeight * 8,
                        child: Text(
                          "Cart",
                          style: TextStyle(
                              color: COLORS.primary,
                              fontSize: SizeConfig.blockWidth * 8,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockHeight * 3),
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return CartListItem(
                              medicine: medicineList[i],
                            );
                          },
                        ),
                      ),
                      // Spacer(),
                      Container(
                        height: SizeConfig.blockHeight * 10,
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockWidth * 2),
                        color: COLORS.white,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "TOTAL: \u20b9$sum",
                                style: TextStyle(
                                    color: COLORS.primary,
                                    // fontSize: SizeConfig.blockWidth * 4,
                                    fontWeight: FontWeight.bold),
                              ),
                              MaterialButton(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.blockWidth * 1),
                                ),
                                color: COLORS.goldenYellow,
                                onPressed: () {},
                                child: Text(
                                  "PLACE ORDER",
                                  style: TextStyle(
                                      color: COLORS.primary,
                                      letterSpacing: 1,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        }

        // floatingActionButton: MaterialButton(
        //   elevation: 3,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 1),
        //   ),
        //   color: COLORS.goldenYellow,
        //   onPressed: () {},
        //   child: Text(
        //     "PLACE ORDER",
        //     style: TextStyle(
        //         color: COLORS.primary,
        //         letterSpacing: 1,
        //         fontWeight: FontWeight.bold),
        //   ),
        // ),
        );
  }
}
