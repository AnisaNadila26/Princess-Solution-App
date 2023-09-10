import 'package:flutter/material.dart';
// import 'package:princess_solution/login/login_page.dart';
import 'package:princess_solution/onBoarding/onBoarding_page.dart';

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
          builder: (context) => OnboardingPage(index: 0,)), (route) => false
      );
    });
    notifyListeners();
  }
}

// import 'package:flutter/material.dart';
// import 'package:princess_solution/data/preference.dart';
// import 'package:princess_solution/data/preference_ins.dart';
// import 'package:princess_solution/menu/menu_page.dart';
// import 'package:princess_solution/menu/menu_page_ins.dart';
// import 'package:princess_solution/models/user.dart';
// import 'package:princess_solution/models/instruktur.dart';
// import 'package:princess_solution/onBoarding/onBoarding_page.dart';

// class SplashScreenNotifier extends ChangeNotifier {
//   final BuildContext context;

//   SplashScreenNotifier(this.context) {
//     getProfile();
//     notifyListeners();
//   }

//   User? users;
//   Instruktur? ins;
//   getProfile() async {
//     Preference().getUsers().then((value) {
//       PreferenceInstruktur().getInstruktur().then((value2) {
//         users = value;
//         ins = value2;
        
//         Future.delayed(const Duration(seconds: 5)).then((value) {
//           users!.noRegistrasi != 'zero'
//               ? Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(builder: (context) => const MenuPage()),
//                   (route) => false)
//               : ins!.idInstruktur != 'zero'
//                   ? Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const MenuPageInstruktur()),
//                       (route) => false)
//                   : Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(builder: (context) => OnboardingPage(index: 0)),
//                       (route) => false);
//         });
//         notifyListeners();
//       });
//     });
//   }
// }

