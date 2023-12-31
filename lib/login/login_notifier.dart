// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:princess_solution/models/user.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/repository/login_repository.dart';
import 'package:princess_solution/menu/menu_page.dart';
import 'package:princess_solution/menu/menu_page_ins.dart';

class LoginNotifier extends ChangeNotifier {
  final BuildContext context;

  LoginNotifier(this.context);

  User? users;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordVisible = false;

  passwordVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  cekLogin() {
    if (keyForm.currentState!.validate()) {
      masuk();
    }
  }

  Future masuk() async {
    try {
      LoginRepository.login(
        NetworkURL.login(),
        email.text.trim(),
        password.text.trim(),
      ).then((value) {
        Navigator.pop(context);
        if (value['code'] == 200) {
          // print("RESPONSE JSON: ${jsonEncode(value)}");
          // print("Data Role: ${value['data']['role']}");
          if (value['data']['role'] == 'siswa') {
            User users = User.fromJson(value['data']);
            Preference().setUsers(users);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
              (route) => false,
            );
          } else if (value['data']['role'] == 'instruktur') {
            Instruktur ins = Instruktur.fromJson(value['data']);
            PreferenceInstruktur().setInstruktur(ins);
            // try {
            //   Instruktur ins = Instruktur.fromJson(value['data']);
            //   print("Instruktur Model: ${jsonEncode(ins)}");
            // } catch (e) {
            //   print("Error parsing JSON to Instruktur Model: $e");
            // }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const MenuPageInstruktur()),
              (route) => false,
            );
          }
        }
      }).catchError((error) {
        final snackBar = SnackBar(
          content: Text(
            'Email atau Password salah',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          backgroundColor: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(50),
          elevation: 30,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    } catch (error) {
      print(error);
    }
  }
}
