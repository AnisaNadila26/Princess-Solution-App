import 'package:flutter/material.dart';

class MenuNotifier extends ChangeNotifier {
  final BuildContext context;

  MenuNotifier(this.context);

  int page = 0;
  gantiPage(int pages) {
    page = pages;
    notifyListeners();
  }

  goPengumuman() {
    page = 1;
    notifyListeners();
  }
}
