import 'package:flutter/material.dart';
import 'package:princess_solution/models/hari.dart';
import 'package:princess_solution/models/materi.dart';
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

  List<Materi> materi = [];

  // Future getMateri(String hari) async {
  //   isLoading = true;
  //   SiswaRepository.getMateri(NetworkURL.getMateri(), hari).then((value) {
  //     if (value['code'] == 200) {
  //       for (Map<String, dynamic> i in value['data']) {
  //         materi.add(Materi.fromJson(i));
  //       }
  //       isLoading = false;
  //       notifyListeners();
  //     } else {
  //       isLoading = false;
  //       notifyListeners();
  //     }
  //   });
  // }

  Future getMateri(String hari) async {
    isLoading = true;
    try {
      List<Materi> materi =
          await SiswaRepository.getMateri(NetworkURL.getMateri(), hari);
      this.materi = materi;
      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
    }
  }
}
