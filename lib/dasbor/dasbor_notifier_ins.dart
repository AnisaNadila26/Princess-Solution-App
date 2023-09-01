import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/models/berita.dart';
import 'package:princess_solution/repository/berita_repository.dart';
import 'package:princess_solution/network/network.dart';

class DasborNotifierInstruktur extends ChangeNotifier {
  final BuildContext context;

  DasborNotifierInstruktur(this.context) {
    getInstruktur();
    getBerita();
    notifyListeners();
  }

  Instruktur? ins;
  var onAppBar = false;
  var isLoading = true;

  showAppBar() {
    onAppBar = true;
    notifyListeners();
  }

  hideAppBar() {
    onAppBar = false;
    notifyListeners();
  }

  getInstruktur() async {
    isLoading = true;
    PreferenceInstruktur().getInstruktur().then((value) {
      ins = value;
      isLoading = false;
      notifyListeners();
    });
  }

  List<Berita> listBerita = [];
  Future getBerita() async {
    listBerita.clear();
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
