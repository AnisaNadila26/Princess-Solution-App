import 'package:flutter/material.dart';
import 'package:princess_solution/models/hari.dart';
import 'package:princess_solution/repository/siswa_repository.dart';
import 'package:princess_solution/network/network.dart';

class NilaiDetailNotifier extends ChangeNotifier {
  final BuildContext context;

  NilaiDetailNotifier(this.context) {
    getHari();
    notifyListeners();
  }

  bool isLoading = true;

  List<Hari> listHari = [];
  Future getHari() async {
    isLoading = true;
    SiswaRepository.getHari(NetworkURL.getHari()).then((value) {
      if (value['code'] == 200) {
        for (Map<String, dynamic> i in value['data']) {
          listHari.add(Hari.fromJson(i));
        }
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
