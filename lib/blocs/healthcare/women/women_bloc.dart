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
part 'women_event.dart';
part 'women_state.dart';

class WomenBloc extends Bloc<WomenEvent, WomenState> {
  WomenBloc() : super(WomenInitial()) {
    healthCareDao = HealthCareDao();
  }

  HealthCareDao healthCareDao;

  @override
  Stream<WomenState> mapEventToState(WomenEvent event) async* {
    if (event is FetchWomen) {
      // yield* _mapFetchWomenToState(event);
    } else if (event is FetchAllWomens) {
      yield* _mapFetchAllWomensToState(event);
    }
  }

  // Stream<WomenState> _mapFetchWomenToState(FetchWomen event) async* {
  //   yield WomenLoading();
  //   try {
  //     var response = await healthCareDao.fetchHealthCare(category: "women");
  //     var jsonDecoded = jsonDecode(response);
  //     customLog(jsonDecoded['status'].toString());
  //     if (response.statusCode == 200 && jsonDecoded['docs'] != null) {
  //       customLog(jsonDecoded);
  //       List<HealthCare> womenProducts = [];
  //       for (var i in jsonDecoded['docs']) {
  //         customLog(i.toString());
  //         womenProducts.add(HealthCare.fromJson(i));
  //       }
  //       yield FetchWomensSuccess(womenProducts: womenProducts);
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
  //     yield WomenFailure(message: "Something went wrong");
  //   }
  // }

  Stream<WomenState> _mapFetchAllWomensToState(FetchAllWomens event) async* {
    yield WomenLoading();
    try {
      Response response =
          await healthCareDao.fetchHealthCare(category: "women");
      var jsonDecoded = jsonDecode(response.body);
      customLog("jsonDecoded for women is: $jsonDecoded");
      customLog("${response.statusCode}");
      if (response.statusCode == 200 && jsonDecoded != null) {
        customLog(jsonDecoded.length.toString());
        List<HealthCare> womenProducts = [];
        for (int i = 0; i < jsonDecoded['docs'].length; i++) {
          womenProducts.add(
            HealthCare.fromJson(jsonDecoded['docs'][i]),
          );
        }
        yield FetchWomensSuccess(womenProducts: womenProducts);
      } else {
        // final snackBar = SnackBar(content: Text("${jsonDecoded['message']}"));
        // ScaffoldMessenger.of(GlobalBlocClass.homeContext)
        //     .showSnackBar(snackBar);
      }
    } catch (err) {
      customLog(err.toString());
      yield WomenFailure(message: "Something went wrong");
    }
  }
}
