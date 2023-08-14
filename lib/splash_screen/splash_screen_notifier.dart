import 'package:flutter/material.dart';
import 'package:princess_solution/login/login_page.dart';

class SplashScreenNotifier extends ChangeNotifier {
  final BuildContext context;

  SplashScreenNotifier(this.context) {
    init();
    notifyListeners();
  }

  init() async {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage()), (route) => false
      );
    });
    notifyListeners();
  }
}
