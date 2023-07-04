import 'package:flutter/material.dart';

class ProfilNotifier extends ChangeNotifier {
  final BuildContext context;

  ProfilNotifier(this.context);
  var onAppBar = false;

  showAppBar() {
    onAppBar = true;
    notifyListeners();
  }

  hideAppBar() {
    onAppBar = false;
    notifyListeners();
  }
}
