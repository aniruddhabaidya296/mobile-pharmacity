import 'dart:convert';
import 'package:pharmacity/constants/custom_log.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class CartDao {
  Future getCart() async {
    var url = '${Config.url}/users/access';

    final response = await http.post(
      Uri.parse(url),
      headers: Config.authHeaders(),
      body: jsonEncode(
        {
          "userId": Config.userId,
          "clientId": Config.clientId,
          "clientSecret": Config.clientSecret
        },
      ),
    );

    customLog(response.body.toString());
    customLog('Response status:${response.statusCode}');
    customLog('Response body:${response.body}');

    return response;
  }
}
