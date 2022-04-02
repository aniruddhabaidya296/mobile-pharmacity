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
part 'men_event.dart';
part 'men_state.dart';

class MenBloc extends Bloc<MenEvent, MenState> {
  MenBloc() : super(MenInitial()) {
    healthCareDao = HealthCareDao();
  }

  HealthCareDao healthCareDao;

  @override
  Stream<MenState> mapEventToState(MenEvent event) async* {
    if (event is FetchMen) {
      // yield* _mapFetchMenToState(event);
    } else if (event is FetchAllMens) {
      yield* _mapFetchAllMensToState(event);
    }
  }

  // Stream<MenState> _mapFetchMenToState(FetchMen event) async* {
  //   yield MenLoading();
  //   try {
  //     var response = await healthCareDao.fetchHealthCare(category: "men");
  //     var jsonDecoded = jsonDecode(response);
  //     customLog(jsonDecoded['status'].toString());
  //     if (response.statusCode == 200 && jsonDecoded['status'] == 'success') {
  //       customLog(jsonDecoded);
  //       yield MenSuccess();
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
  //     yield MenFailure(message: "Something went wrong");
  //   }
  // }

  Stream<MenState> _mapFetchAllMensToState(FetchAllMens event) async* {
    yield MenLoading();
    try {
      Response response = await healthCareDao.fetchHealthCare(category: 'men');
      var jsonDecoded = jsonDecode(response.body);
      customLog("jsonDecoded is: $jsonDecoded");
      customLog("${response.statusCode}");
      if (response.statusCode == 200 && jsonDecoded != null) {
        customLog(jsonDecoded.length.toString());
        List<HealthCare> menProducts = [];
        for (var i in jsonDecoded['docs']) {
          menProducts.add(
            HealthCare.fromJson(i),
          );
        }
        yield FetchMensSuccess(menProducts: menProducts);
      } else {
        // final snackBar = SnackBar(content: Text("${jsonDecoded['message']}"));
        // ScaffoldMessenger.of(GlobalBlocClass.homeContext)
        //     .showSnackBar(snackBar);
      }
    } catch (err) {
      customLog(err.toString());
      yield MenFailure(message: "Something went wrong");
    }
  }
}
