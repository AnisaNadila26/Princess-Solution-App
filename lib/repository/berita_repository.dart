// import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class BeritaRepository {
  static Future<dynamic> getBerita(String url) async {
    Dio dio = Dio();
    final response = await dio.get(url);

    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA BERITA : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }
}
