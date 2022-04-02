import 'dart:convert';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:pharmacity/model/medicine.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class HealthCareDao {
  Future fetchHealthCare({String category}) async {
    var url = '${Config.url}/healthcare-products?category=$category';

    final response = await http.get(
      Uri.parse(url),
      headers: Config.authHeaders(),
    );

    customLog(response.body.toString());
    customLog('Response status:${response.statusCode}');
    customLog('Response body:${response.body}');

    return response;
  }
}
