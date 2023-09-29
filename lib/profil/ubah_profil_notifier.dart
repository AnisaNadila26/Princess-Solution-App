import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:princess_solution/data/preference.dart';
import 'package:princess_solution/menu/menu_page.dart';
import 'package:princess_solution/models/user.dart';
import 'package:princess_solution/repository/profil_repository.dart';
import 'package:princess_solution/network/network.dart';
import 'package:file_picker/file_picker.dart';

class UbahProfilNotifier extends ChangeNotifier {
  final BuildContext context;

  UbahProfilNotifier(this.context) {
    getProfile();
    notifyListeners();
  }

  int noRegistrasi = 0;
  bool isLoading = true;
  bool isDataChanged = false;

  User? users;
  String fotoProfil = '';
  List<PlatformFile>? paths;
  List<int>? file;
  Uint8List? fileToDisplay;
  // bool hapusFoto = false;
  DateTime selectedDate = DateTime.now();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telpon = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController alamat = TextEditingController();

  Future<bool> backConfirmDialog(BuildContext context) async {
    if (isDataChanged) {
      return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Theme.of(context).cardColor,
            content: Container(
              height: 200,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Simpan Perubahan',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Apakah Anda ingin menyimpan perubahan yang Anda lakukan?',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FilledButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          'Batal',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      FilledButton(
                        onPressed: () async {
                          await cekUpdate();
                        },
                        child: Text(
                          'Simpan',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: Color.fromRGBO(76, 105, 176, 1.0),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
    } else {
      return true;
    }
  }

  getProfile() async {
    isLoading = true;
    Preference().getUsers().then((value) {
      users = value;
      noRegistrasi = int.parse(users!.noRegistrasi!);
      nama = TextEditingController(text: users!.nama);
      tanggalLahir = TextEditingController(text: users!.ttl.toString());
      email = TextEditingController(text: users!.email);
      telpon = TextEditingController(text: users!.telpon);
      pekerjaan = TextEditingController(text: users!.pekerjaan);
      alamat = TextEditingController(text: users!.alamat);
      fotoProfil = users!.fotoProfil!;
      notifyListeners();
      isLoading = false;
      notifyListeners();
    });
  }

  filepick() async {
    paths = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    ))
        ?.files;

    if (paths != null) {
      final int maxSize = 1000 * 1024;
      final int fileSize = paths!.first.size;

      if (fileSize > maxSize) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Peringatan'),
            content: Text('Ukuran foto melebihi batas maksimum 2000 KB.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tutup'),
              ),
            ],
          ),
        );
      } else {
        file = paths!.first.bytes!;
        fileToDisplay = Uint8List.fromList(file!);
        fotoProfil = paths!.first.name;
        // hapusFoto = false;
        Navigator.pop(context);
        notifyListeners();
      }
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate.subtract(Duration(days: 365 * 50)),
      lastDate: selectedDate,
      // builder: (BuildContext context, Widget? child) {
      //   return Theme(
      //     data: ThemeData.light().copyWith(
      //       primaryColor: Colors.black, // Warna kepala tanggal yang dipilih
      //       accentColor:Colors.pink, // Warna tanggal yang dipilih dan tanggal hari ini
      //       buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      //       dialogBackgroundColor: Colors.white, // Warna latar belakang dialog
      //     ),
      //     child: child!,
      //   );
      // },
    );

    if (picked != null && picked != selectedDate) {
      tanggalLahir.text = DateFormat('yyyy-MM-dd').format(picked);
      notifyListeners();
    }
  }

  cekUpdate() {
    if (keyForm.currentState!.validate()) {
      ubahProfilSiswa();
    }
  }

  Future ubahProfilSiswa() async {
    try {
      var response = await ProfilRepository.ubahProfilSiswa(
        NetworkURL.ubahProfilSiswa(),
        noRegistrasi,
        nama.text.trim(),
        tanggalLahir.text.trim(),
        email.text.trim(),
        telpon.text.trim(),
        pekerjaan.text.trim(),
        alamat.text.trim(),
        file == null ? [] : file,
        fotoProfil == '' ? 'default' : fotoProfil,
      );

      if (response['code'] == 200) {
        User users = User.fromJson(response['data']);
        Preference().setEdit(users);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPage(),
            settings: RouteSettings(
              arguments: {'page': 4},
            ),
          ),
          (route) => false,
        );
      } else {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${response['message']}"),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Oke"),
                  )
                ],
              ),
            );
          },
        );
        print("gagal");
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  void deleteFotoProfil() async {
    // hapusFoto = true;
    // await Preference().removeFotoProfil();
    paths = null;
    file = null;
    fotoProfil = '';
    isLoading = true;
    Navigator.pop(context);
    isLoading = false;
    notifyListeners();
  }
}
