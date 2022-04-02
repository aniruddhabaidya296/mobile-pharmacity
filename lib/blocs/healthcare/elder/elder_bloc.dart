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
part 'elder_event.dart';
part 'elder_state.dart';

class ElderBloc extends Bloc<ElderEvent, ElderState> {
  ElderBloc() : super(ElderInitial()) {
    healthCareDao = HealthCareDao();
  }

  HealthCareDao healthCareDao;

  @override
  Stream<ElderState> mapEventToState(ElderEvent event) async* {
    if (event is FetchElder) {
      // yield* _mapFetchElderToState(event);
    } else if (event is FetchAllElders) {
      yield* _mapFetchAllEldersToState(event);
    }
  }

  // Stream<ElderState> _mapFetchElderToState(FetchElder event) async* {
  //   yield ElderLoading();
  //   try {
  //     var response = await healthCareDao.fetchHealthCare(category: "elder");
  //     var jsonDecoded = jsonDecode(response);
  //     customLog(jsonDecoded['status'].toString());
  //     if (response.statusCode == 200 && jsonDecoded['status'] == 'success') {
  //       customLog(jsonDecoded);
  //       yield ElderSuccess();
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
  //     yield ElderFailure(message: "Something went wrong");
  //   }
  // }

  Stream<ElderState> _mapFetchAllEldersToState(FetchAllElders event) async* {
    yield ElderLoading();
    try {
      Response response =
          await healthCareDao.fetchHealthCare(category: "elder");
      var jsonDecoded = jsonDecode(response.body);
      customLog("jsonDecoded is: $jsonDecoded");
      customLog("${response.statusCode}");
      if (response.statusCode == 200 && jsonDecoded['docs'] != null) {
        customLog(jsonDecoded.length.toString());
        List<HealthCare> elderProducts = [];
        for (int i = 0; i < jsonDecoded['docs'].length; i++) {
          elderProducts.add(
            HealthCare.fromJson(jsonDecoded['docs'][i]),
          );
        }
        yield FetchEldersSuccess(elderProducts: elderProducts);
      } else {
        // final snackBar = SnackBar(content: Text("${jsonDecoded['message']}"));
        // ScaffoldMessenger.of(GlobalBlocClass.homeContext)
        //     .showSnackBar(snackBar);
      }
    } catch (err) {
      customLog(err.toString());
      yield ElderFailure(message: "Something went wrong");
    }
  }
}
