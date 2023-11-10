import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RatingRepository {
  static Future<dynamic> rating(String url, int id, int idInstruktur,
      double rating, String review) async {
    print(url);
    print(id);
    print(idInstruktur);
    print(rating);
    print(review);

    FormData formData = FormData.fromMap({
      "id": id,
      "id_instruktur": idInstruktur,
      "rating": rating,
      "review": review,
    });
    Dio dio = Dio();
    final response = await dio.post(url, data: formData);

    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA RATING : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }

  static Future<dynamic> getRating(String url) async {
    Dio dio = Dio();
    final response = await dio.get(url);

    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA RATING : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }
}
