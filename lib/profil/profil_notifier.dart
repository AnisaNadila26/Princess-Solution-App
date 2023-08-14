import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/login/login_page.dart';

class ProfilNotifier extends ChangeNotifier {
  final BuildContext context;

  ProfilNotifier(this.context) {
    getProfile();
    notifyListeners();
  }

  Data? users;
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

  getProfile() async {
    isLoading = true;
    Preference().getUsers().then((value) {
      users = value;
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
