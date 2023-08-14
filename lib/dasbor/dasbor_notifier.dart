import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/models/berita.dart';
import 'package:princess_solution/repository/berita_repository.dart';
import 'package:princess_solution/network/network.dart';

import '../models/instruktur.dart';
import '../repository/login_repository.dart';

class DasborNotifier extends ChangeNotifier {
  final BuildContext context;

  DasborNotifier(this.context) {
    getProfile();
    getBerita();
    notifyListeners();
  }

  Data? users;
  Instruktur? instruktur;
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

  // getProfile() async {
  //   isLoading = true;
  //   Preference().getUsers().then((value) {
  //     users = value;
  //     isLoading = false;
  //     notifyListeners();
  //   });
  // }
  getProfile() async {
    final profile = await Preference().getUsers();
    users = profile;

    if (users != null && users!.instruktur.idInstruktur.isNotEmpty) {
      instruktur = await InstrukturRepository.getInstruktur(
          int.parse(users!.instruktur.idInstruktur));
    }
    notifyListeners();
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
