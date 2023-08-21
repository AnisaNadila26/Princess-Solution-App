import 'package:flutter/material.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/repository/login_repository.dart';
import 'package:princess_solution/menu/menu_page.dart';

class LoginNotifier extends ChangeNotifier {
  final BuildContext context;

  LoginNotifier(this.context);

  Data? users;

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
      simpan();
    }
  }

  Future simpan() async {
    try {
      LoginRepository.login(
        NetworkURL.login(),
        email.text.trim(),
        password.text.trim(),
      ).then((value) {
        Navigator.pop(context);
        if (value['code'] == 200) {
          if (value['data']['role'] == 'siswa') {
            Data users = Data.fromJson(value['data']);
            Preference().setUsers(users);
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
              (route) => false,
            );
          }
        }
      }).catchError((error) {
        final snackBar = SnackBar(
          content: Text('$error'),
          backgroundColor: Colors.black,
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

  // getProfile() async {
  //   final profile = await Preference().getUsers();
  //   users = profile;

  //   if (users != null && users!.instruktur.idInstruktur.isNotEmpty) {
  //     instruktur = await InstrukturRepository.getInstruktur(
  //         int.parse(users!.instruktur.idInstruktur));
  //   }

  //   notifyListeners();
  // }
}
