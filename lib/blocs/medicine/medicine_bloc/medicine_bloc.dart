import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/constants/snack_style.dart';
import 'package:pharmacity/dao/medicine_dao.dart';
import 'package:pharmacity/global_handlers/global_bloc_class.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:http/http.dart';
part 'medicine_event.dart';
part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  MedicineBloc() : super(MedicineInitial()) {
    medicineDao = MedicineDao();
  }

  MedicineDao medicineDao;

  @override
  Stream<MedicineState> mapEventToState(MedicineEvent event) async* {
    if (event is FetchMedicine) {
      yield* _mapFetchMedicineToState(event);
    } else if (event is FetchAllMedicines) {
      yield* _mapFetchAllMedicinesToState(event);
    } else if (event is SearchMedicine) {
      yield* _mapSearchMedicineToState(event);
    }
  }

  Stream<MedicineState> _mapSearchMedicineToState(SearchMedicine event) async* {
    yield MedicineLoading();
    try {
      var response = await medicineDao.searchMedicines(word: event.word);
      var jsonDecoded = jsonDecode(response.body);
      customLog("jsonDecoded: ${jsonDecoded.toString()}");
      if (response.statusCode == 200 && jsonDecoded != null) {
        customLog(jsonDecoded.toString());
        List<Medicine> medicines = [];
        for (int i = 0; i < jsonDecoded.length; i++) {
          medicines.add(
            Medicine.fromJson(jsonDecoded[i]),
          );
        }
        yield SearchMedicineSuccess(medicines: medicines);
      } else {
        yield MedicineFailure(message: jsonDecoded['message']);
      }
    } catch (err) {
      yield MedicineFailure(message: "Something went wrong");
    }
  }

  Stream<MedicineState> _mapFetchMedicineToState(FetchMedicine event) async* {
    yield MedicineLoading();
    try {
      var response =
          await medicineDao.fetchMedicinesById(medicineId: event.medicineId);
      var jsonDecoded = jsonDecode(response);
      customLog(jsonDecoded['status'].toString());
      if (response.statusCode == 200 && jsonDecoded['status'] == 'success') {
        customLog(jsonDecoded);
        yield MedicineSuccess();
      } else {
        final snackBar = SnackBar(
            content: Text(
          "${jsonDecoded['message']}",
          style: snackStyle,
        ));
        ScaffoldMessenger.of(GlobalBlocClass.homeContext)
            .showSnackBar(snackBar);
      }
    } catch (err) {
      yield MedicineFailure(message: "Something went wrong");
    }
  }

  Stream<MedicineState> _mapFetchAllMedicinesToState(
      FetchAllMedicines event) async* {
    yield MedicineLoading();
    try {
      Response response = await medicineDao.fetchAllMedicines();
      var jsonDecoded = jsonDecode(response.body);
      customLog("jsonDecoded is: $jsonDecoded");
      customLog("${response.statusCode}");
      if (response.statusCode == 200 && jsonDecoded != null) {
        customLog(jsonDecoded.length.toString());
        List<Medicine> medicines = [];
        for (int i = 0; i < jsonDecoded.length; i++) {
          medicines.add(
            Medicine.fromJson(jsonDecoded[i]),
          );
        }
        yield FetchMedicinesSuccess(medicines: medicines);
      } else {
        // final snackBar = SnackBar(content: Text("${jsonDecoded['message']}"));
        // ScaffoldMessenger.of(GlobalBlocClass.homeContext)
        //     .showSnackBar(snackBar);
      }
    } catch (err) {
      customLog(err.toString());
      yield MedicineFailure(message: "Something went wrong");
    }
  }
}
