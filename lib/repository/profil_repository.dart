import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ProfilRepository {
  static Future<dynamic> ubahProfilSiswa(
    String url,
    int noRegistrasi,
    String nama,
    String tanggalLahir,
    String email,
    String telpon,
    String pekerjaan,
    String alamat,
    List<int>? fotoProfil,
    String? namaFoto,
  ) async {
    print(url);
    print(noRegistrasi);
    print(nama);
    print(tanggalLahir);
    print(email);
    print(telpon);
    print(pekerjaan);
    print(alamat);
    print(namaFoto);

    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "no_registrasi": noRegistrasi,
      "nama": nama,
      "ttl": tanggalLahir,
      "email": email,
      "telpon": telpon,
      "pekerjaan": pekerjaan,
      "alamat": alamat,
      "foto_profil": namaFoto == ""
          ? ""
          : MultipartFile.fromBytes(fotoProfil!, filename: namaFoto),
    });

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA UPDATE : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }

  static Future<dynamic> ubahProfilInstruktur(
    String url,
    int idInstruktur,
    String nama,
    String email,
    String telpon,
    String usia,
    List<int>? fotoProfil,
    String? namaFoto,
  ) async {
    print(url);
    print(idInstruktur);
    print(nama);
    print(email);
    print(telpon);
    print(usia);
    print(namaFoto);

    Dio dio = Dio();
    FormData formData = FormData.fromMap({
      "id_instruktur": idInstruktur,
      "nama": nama,
      "email": email,
      "telpon": telpon,
      "usia": usia,
      "foto_profil": namaFoto == ""
          ? ""
          : MultipartFile.fromBytes(fotoProfil!, filename: namaFoto),
    });

    final response = await dio.post(url, data: formData);
    if (kDebugMode) {
      print("RESPONSE STATUS CODE : ${response.statusCode}");
    }
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print("RESPONSE DATA UPDATE : ${response.data}");
      }
      return response.data;
    } else {
      return response.data;
    }
  }
}
