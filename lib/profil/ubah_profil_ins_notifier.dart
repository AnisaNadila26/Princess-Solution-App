import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  var isLoading = true;
  Instruktur? ins;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController nama = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telpon = TextEditingController();
  TextEditingController usia = TextEditingController();

  String fotoProfil = '';
  List<PlatformFile>? paths;
  List<int>? file;
  Uint8List? fileToDisplay;

  getInstruktur() async {
    isLoading = true;
    PreferenceInstruktur().getInstruktur().then((value) {
      ins = value;
      idInstruktur = int.parse(ins!.idInstruktur!);
      nama = TextEditingController(text: ins!.nama);
      email = TextEditingController(text: ins!.email);
      telpon = TextEditingController(text: ins!.telpon);
      usia = TextEditingController(text: ins!.usia);
      fotoProfil = ins!.fotoProfil!;
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
        Navigator.pop(context);
        notifyListeners();
      }
    } else {
      if (kDebugMode) {
        print('No image selected.');
      }
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
        telpon.text.trim(),
        usia.text.trim(),
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
