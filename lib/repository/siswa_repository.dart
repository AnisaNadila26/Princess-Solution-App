import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SiswaRepository {
  static Future<dynamic> getSiswa(String url, String idInstruktur) async {
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

  static Future<dynamic> getMateri(String url, String hari) async {
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

  static Future<dynamic> kirimNilai(String url, int noRegistrasi,
      int idInstruktur, String nilaiJson, String catatan, int idHari) async {
    print(url);
    print(noRegistrasi);
    print(idInstruktur);
    print(nilaiJson);
    print(catatan);
    print(idHari);

    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "no_registrasi": noRegistrasi,
      "id_instruktur": idInstruktur,
      "nilai": nilaiJson,
      "catatan": catatan,
      "id_hari": idHari,
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

  static Future<Map<String, dynamic>> getNilai(String url, String noRegistrasi,
      String idInstruktur, String idHari) async {
    try {
      FormData formData = FormData.fromMap({
        "no_registrasi": noRegistrasi,
        "id_instruktur": idInstruktur,
        "id_hari": idHari,
      });
      Dio dio = Dio();
      final response = await dio.post(url, data: formData);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("RESPONSE DATA AMBIL NILAI : ${response.data}");
        }
        final Map<String, dynamic> data = response.data;

        if (data.containsKey('data')) {
          final List<dynamic> nilaiDataList = data['data'];

          final Map<String, Map<String, int>> nilaiMap = {};
          String catatan = '';

          for (final dynamic nilaiData in nilaiDataList) {
            final dynamic nilaiList = nilaiData['nilai'];
            final List<dynamic> parsedNilaiList = jsonDecode(nilaiList);

            for (final dynamic nilaiItem in parsedNilaiList) {
              final String idKategori = nilaiItem['id_kategori'];
              final Map<String, dynamic> dataNilai = nilaiItem['data_nilai'];

              final Map<String, int> nilaiMapJson = {};

              dataNilai.forEach((idMateri, nilai) {
                nilaiMapJson[idMateri] = nilai as int;
              });

              nilaiMap[idKategori] = nilaiMapJson;
            }
            if (nilaiData.containsKey('catatan')) {
              catatan = nilaiData['catatan'];
            }
          }
          return {'nilaiMap': nilaiMap, 'catatan': catatan};
        } else {
          print("Data nilai tidak ditemukan");
          return <String, dynamic>{};
        }
      } else {
        print("Data nilai tidak ditemukan");
        return <String, dynamic>{};
      }
    } catch (error) {
      print("Data nilai tidak ditemukan");
      return <String, dynamic>{};
    }
  }
}
