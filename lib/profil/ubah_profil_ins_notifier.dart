import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/menu/menu_page_ins.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/repository/profil_repository.dart';
import 'package:princess_solution/network/network.dart';
import 'package:file_picker/file_picker.dart';

class UbahProfilInsNotifier extends ChangeNotifier {
  final BuildContext context;

  UbahProfilInsNotifier(this.context) {
    getInstruktur();
    notifyListeners();
  }

  int idInstruktur = 0;
  bool isLoading = true;
  bool isDataChanged = false;

  Instruktur? ins;
  String fotoProfil = '';
  List<PlatformFile>? paths;
  String filePaths = '';
  List<int>? file;
  Uint8List? fileToDisplay;
  DateTime selectedDate = DateTime.now();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();

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

  getInstruktur() async {
    isLoading = true;
    PreferenceInstruktur().getInstruktur().then((value) {
      ins = value;
      idInstruktur = int.parse(ins!.idInstruktur!);
      nama = TextEditingController(text: ins!.nama);
      email = TextEditingController(text: ins!.email);
      tanggalLahir = TextEditingController(text: ins!.tanggalLahir);
      fotoProfil = ins!.fotoProfil!;
      notifyListeners();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> pickFile() async {
    // await _requestStoragePermission();
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (result != null) {
      final int maxSize = 3000 * 1024;
      final int fileSize = result.files.single.size;

      if (fileSize > maxSize) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text('Peringatan'),
            content: Text('Ukuran foto melebihi batas maksimum 3000 KB.'),
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
        filePaths = result.files.single.path!;
        file = await File(filePaths).readAsBytes();
        fotoProfil = result.files.single.name;
        Navigator.pop(context);
        notifyListeners();
      }
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
    }
  }

  filepick() async {
    paths = (await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    ))
        ?.files;

    if (paths != null) {
      final int maxSize = 2000 * 1024;
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
      ubahProfilIns();
    }
  }

  Future ubahProfilIns() async {
    try {
      var response = await ProfilRepository.ubahProfilInstruktur(
        NetworkURL.ubahProfilInstruktur(),
        idInstruktur,
        nama.text.trim(),
        email.text.trim(),
        tanggalLahir.text.trim(),
        file == null ? [] : file,
        fotoProfil == '' ? 'default' : fotoProfil,
      );

      if (response['code'] == 200) {
        Instruktur ins = Instruktur.fromJson(response['data']);
        PreferenceInstruktur().setEdit(ins);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MenuPageInstruktur(),
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
