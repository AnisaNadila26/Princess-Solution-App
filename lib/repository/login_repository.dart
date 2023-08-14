// import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../network/network.dart';


class LoginRepository {
  static Future<dynamic> login(
    String url, String email, String password) async {
      FormData formData = FormData.fromMap({
      "email": email,
      "password": password,
    });
    Dio dio = Dio();
    final response = await dio.post(url, data: formData);
    
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA LOGIN : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }
}

class InstrukturRepository {
  static Future<dynamic> getInstruktur(int idInstruktur) async {
    Dio dio = Dio();
    final response = await dio.get(NetworkURL.getInstruktur(idInstruktur));

    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA INSTRUKTUR : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }
}
