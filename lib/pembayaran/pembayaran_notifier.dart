import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/models/user.dart';

class PembayaranNotifier extends ChangeNotifier {
  final BuildContext context;

  PembayaranNotifier(this.context) {
    getProfile();
    notifyListeners();
  }

  User? users;
  var isLoading = true;

  getProfile() async {
    isLoading = true;
    Preference().getUsers().then((value) {
      users = value;
      isLoading = false;
      notifyListeners();
    });
  }
}
