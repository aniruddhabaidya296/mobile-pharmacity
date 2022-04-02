import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/constants/snack_style.dart';
import 'package:pharmacity/dao/healthcare_dao.dart';
import 'package:pharmacity/dao/medicine_dao.dart';
import 'package:pharmacity/global_handlers/global_bloc_class.dart';
import 'package:pharmacity/model/healthcare.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:http/http.dart';
part 'baby_event.dart';
part 'baby_state.dart';

class BabyBloc extends Bloc<BabyEvent, BabyState> {
  BabyBloc() : super(BabyInitial()) {
    healthCareDao = HealthCareDao();
  }

  HealthCareDao healthCareDao;

  @override
  Stream<BabyState> mapEventToState(BabyEvent event) async* {
    if (event is FetchBaby) {
      // yield* _mapFetchBabyToState(event);
    } else if (event is FetchAllBabys) {
      yield* _mapFetchAllBabysToState(event);
    }
  }

  // Stream<BabyState> _mapFetchBabyToState(FetchBaby event) async* {
  //   yield BabyLoading();
  //   try {
  //     var response = await healthCareDao.fetchHealthCare(category: "baby");
  //     var jsonDecoded = jsonDecode(response);
  //     customLog(jsonDecoded['status'].toString());
  //     if (response.statusCode == 200 && jsonDecoded['docs'] != null) {
  //       customLog(jsonDecoded);
  //       List<HealthCare> babyProducts = [];
  //       for (var i in jsonDecoded['docs']) {
  //         babyProducts.add(HealthCare.fromJson(i));
  //       }
  //       yield FetchBabySuccess(babyProducts: babyProducts);
  //     } else {
  //       final snackBar = SnackBar(
  //           content: Text(
  //         "${jsonDecoded['message']}",
  //         style: snackStyle,
  //       ));
  //       ScaffoldMessenger.of(GlobalBlocClass.homeContext)
  //           .showSnackBar(snackBar);
  //     }
  //   } catch (err) {
  //     yield BabyFailure(message: "Something went wrong");
  //   }
  // }

  Stream<BabyState> _mapFetchAllBabysToState(FetchAllBabys event) async* {
    yield BabyLoading();
    try {
      Response response = await healthCareDao.fetchHealthCare(category: "baby");
      var jsonDecoded = jsonDecode(response.body);
      customLog("jsonDecoded is: $jsonDecoded");
      customLog("${response.statusCode}");
      if (response.statusCode == 200 && jsonDecoded['docs'] != null) {
        // customLog(jsonDecoded.toString());
        List<HealthCare> babyProducts = [];
        for (var i in jsonDecoded['docs']) {
          babyProducts.add(HealthCare.fromJson(i));
        }
        yield FetchBabySuccess(babyProducts: babyProducts);
      } else {
        // final snackBar = SnackBar(content: Text("${jsonDecoded['message']}"));
        // ScaffoldMessenger.of(GlobalBlocClass.homeContext)
        //     .showSnackBar(snackBar);
      }
    } catch (err) {
      customLog(err.toString());
      yield BabyFailure(message: "Something went wrong");
    }
  }
}
