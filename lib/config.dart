import 'dart:io';

class Config {
  static String accessToken = '';
  static String userId = '';
  static String accessCode = '';
  static String clientId = 'mdrop';
  static String clientSecret = 'mdrop';

  static String url = 'https://pharmacity-dgpb.herokuapp.com/api/v1/';

  static Map<String, String> headers() {
    return {
      HttpHeaders.contentTypeHeader: "Application/json",
    };
  }

  // static Map<String,String> setUserId(){
  //   return {

  //   }
  // }

  static Map<String, String> authHeaders() {
    return {
      HttpHeaders.contentTypeHeader: "Application/json",
      "x-access-token": Config.accessToken,
    };
  }

  static String googleKey = "AIzaSyA6pAOQKgM_jbXJLx-KI_aQjK4Rwks5SO0";
  static String razorpayKey = "rzp_test_xBhosNX0Y8G9cq";
  static String rideId = "";
}
