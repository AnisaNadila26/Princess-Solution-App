import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/login/login_page.dart';

class ProfilNotifierInstruktur extends ChangeNotifier {
  final BuildContext context;

  ProfilNotifierInstruktur(this.context) {
    getInstruktur();
    notifyListeners();
  }

  Instruktur? ins;
  var onAppBar = false;
  var isLoading = true;
  bool isLoggedIn = true;

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

  logout() {
    isLoggedIn = false;
    Preference().remove();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false);
    print('User Logout');
    notifyListeners();
  }
}
