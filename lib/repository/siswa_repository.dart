import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SiswaRepository {
  static Future<dynamic> getSiswa(
    String url, String idInstruktur) async {
      FormData formData = FormData.fromMap({
      "id_instruktur": idInstruktur,
    });
    Dio dio = Dio();
    final response = await dio.post(url, data: formData);
    
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA SISWA : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }

  static Future<dynamic> getHari(String url) async {
    Dio dio = Dio();
    final response = await dio.get(url);

    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    return response.data;
  }

  static Future<dynamic> getMateri(
    String url, String hari) async {
      FormData formData = FormData.fromMap({
      "hari": hari,
    });
    Dio dio = Dio();
    final response = await dio.post(url, data: formData);
    
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA MATERI : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }

  static Future<dynamic> kirimNilai(
    String url,
    int noRegistrasi,
    int idInstruktur,
    Map<String, int?> nilaiMap,
  ) async {
    print(url);
    print(noRegistrasi);
    print(idInstruktur);
    print(nilaiMap);

    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "no_registrasi": noRegistrasi,
      "id_instruktur": idInstruktur,
      "nilai": nilaiMap,
    });

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA NILAI : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }
}
