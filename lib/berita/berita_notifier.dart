import 'package:flutter/material.dart';
import 'package:princess_solution/models/berita.dart';
import 'package:princess_solution/repository/berita_repository.dart';
import 'package:princess_solution/network/network.dart';

class BeritaNotifier extends ChangeNotifier {
  final BuildContext context;

  BeritaNotifier(this.context) {
    getBerita();
    notifyListeners();
  }

  bool isLoading = true;

  List<Berita> listBerita = [];
  Future getBerita() async {
    isLoading = true;
    BeritaRepository.getBerita(NetworkURL.getBerita()).then((value) {
      if (value['code'] == 200) {
        for (Map<String, dynamic> i in value['data']) {
          listBerita.add(Berita.fromJson(i));
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
