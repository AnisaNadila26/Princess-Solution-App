import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/models/data.dart';

class DasborNotifier extends ChangeNotifier {
  final BuildContext context;

  DasborNotifier(this.context) {
    getProfile();
  }
   
  Data? users;
  var onAppBar = false;

  showAppBar() {
    onAppBar = true;
    notifyListeners();
  }

  hideAppBar() {
    onAppBar = false;
    notifyListeners();
  }

  getProfile() async {
    Preference().getUsers().then((value) {
      users = value;
      notifyListeners();
    });
  }
  
}
