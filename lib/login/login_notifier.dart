import 'package:flutter/material.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/repository/login_repository.dart';
import 'package:princess_solution/menu/menu_page.dart';

class LoginNotifier extends ChangeNotifier {
  final BuildContext context;

  LoginNotifier(this.context) {
    // obsecureText = true;
    getProfile();
  }

  Data? users;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool obsecureText = true;

  cekLogin() {
    if (keyForm.currentState!.validate()) {
      simpan();
    }
  }

  Future simpan() async {
    LoginRepository.login(
            NetworkURL.login(), email.text.trim(), password.text.trim())
        .then((value) {
      Navigator.pop(context);
      if (value['code'] == 200) {
        Data users = Data.fromJson(value);
        Preference().setUsers(users);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MenuPage()),
            (route) => false);
      } else {
        showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            builder: (context) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Loading"),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Tutup"))
                  ],
                ),
              );
            });
      }
    });
  }

  getProfile() async {
    Preference().getUsers().then((value) {
      users = value;
      notifyListeners();
    });
  }
}
