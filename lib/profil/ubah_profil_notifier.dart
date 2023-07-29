import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/repository/profil_repository.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/profil/profil_page.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker_for_web/image_picker_for_web.dart';

class UbahProfilNotifier extends ChangeNotifier {
  final BuildContext context;

  UbahProfilNotifier(this.context) {
    getProfile();
  }

  int noRegistrasi = 0;
  var isLoading = true;
  Data? users;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telpon = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController fotoProfil = TextEditingController();
  TextEditingController namaFoto = TextEditingController();

  // List<PlatformFile>? paths;
  List<int>? file;
  // final ImagePicker _picker = ImagePicker();

  getProfile() async {
    isLoading = true;
    Preference().getUsers().then((value) {
      users = value;
      noRegistrasi = int.parse(users!.noRegistrasi);
      nama = TextEditingController(text: users!.nama);
      tanggalLahir = TextEditingController(text: users!.tanggalLahir);
      email = TextEditingController(text: users!.email);
      telpon = TextEditingController(text: users!.telpon);
      pekerjaan = TextEditingController(text: users!.pekerjaan);
      alamat = TextEditingController(text: users!.alamat);
      notifyListeners();
      isLoading = false;
      notifyListeners();
    });
  }

  Future ubahProfil() async {
    ProfilRepository.ubahProfil(
            NetworkURL.ubahProfil(),
            noRegistrasi,
            nama.text.trim(),
            tanggalLahir.text.trim(),
            email.text.trim(),
            telpon.text.trim(),
            pekerjaan.text.trim(),
            alamat.text.trim(),
            file,
            fotoProfil.text.trim())
        .then((value) {
      if (value['code'] == 200) {
        getProfile();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ProfilPage()),
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
                    Text("${value['message']}"),
                    const SizedBox(
                      height: 16,
                    ),
                    FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Oke"),
                    )
                  ],
                ),
              );
            });
        print("gagal");
      }
    });
  }
  

  // ubahForm(Data users) {
  //   id = int.parse(users.noRegistrasi);
  //   nama = TextEditingController(text: users.nama);
  //   tanggalLahir = TextEditingController(text: users.tanggalLahir);
  //   email = TextEditingController(text: users.email);
  //   telpon = TextEditingController(text: users.telpon);
  //   pekerjaan = TextEditingController(text: users.pekerjaan);
  //   alamat = TextEditingController(text: users.alamat);
  //   notifyListeners();
  // }
}
