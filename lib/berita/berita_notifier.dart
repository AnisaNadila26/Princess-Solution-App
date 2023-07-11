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

  List<Berita> listBerita = [];
   Future getBerita() async {
    BeritaRepository.getBerita(NetworkURL.getBerita()).then((value) {
      if (value['code'] == 200) {
        for (Map<String, dynamic> i in value['data']) {
          listBerita.add(Berita.fromJson(i));
        }
        notifyListeners();
      }
    });
  }
}
