import 'dart:convert';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class MedicineDao {
  Future searchMedicines({String word}) async {
    var url = '${Config.url}/medicines?search=$word';

    final response = await http.get(
      Uri.parse(url),
      headers: Config.authHeaders(),
    );

    customLog(response.body.toString());
    customLog('Response status:${response.statusCode}');
    customLog('Response body:${response.body}');

    return response;
  }

  Future fetchAllMedicines() async {
    var url = '${Config.url}/medicine?search=calpol';

    final response = await http.get(
      Uri.parse(url),
      headers: Config.authHeaders(),
    );

    customLog(response.body.toString());
    customLog('Response status:${response.statusCode}');
    customLog('Response body:${response.body}');

    return response;
  }

  Future fetchMedicinesById({String medicineId}) async {
    var url =
        '${Config.url}/medicines?noreId=${medicineId}userId=${Config.userId}';

    final response = await http.post(
      Uri.parse(url),
      headers: Config.authHeaders(),
      body: jsonEncode({"medicineId": medicineId}),
    );

    customLog(response.body.toString());
    customLog('Response status:${response.statusCode}');
    customLog('Response body:${response.body}');

    return response;
  }


}
