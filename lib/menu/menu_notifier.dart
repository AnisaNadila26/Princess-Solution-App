import 'package:flutter/material.dart';

class MenuNotifier extends ChangeNotifier {
  final BuildContext context;
  int page;

  MenuNotifier(this.context, this.page);

  // int page = 0;
  gantiPage(int pages) {
    page = pages;
    notifyListeners();
  }

  goPengumuman() {
    page = 1;
    notifyListeners();
  }
}
