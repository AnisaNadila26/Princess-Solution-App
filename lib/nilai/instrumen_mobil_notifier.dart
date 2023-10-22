import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/models/instrumen.dart';
import 'package:princess_solution/repository/siswa_repository.dart';
import 'package:princess_solution/network/network.dart';

class InstrumenMobilNotifier extends ChangeNotifier {
  final BuildContext context;
  final int id;

  InstrumenMobilNotifier(this.context, this.id) {
    getInstruktur();
    fetchData();
    notifyListeners();
  }

  Instruktur? ins;
  bool isLoading = true;
  bool isInstrumenDirty = false;

  // int id = 0;
  // int idInstruktur = 0;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Future<void> fetchData() async {
    await getInstrumen();
    await Future.delayed(Duration(milliseconds: 150));
    await getNilaiInstrumen();
    notifyListeners();
  }

  bool isFormDirty() {
    return isInstrumenDirty;
  }

  getInstruktur() async {
    isLoading = true;
    ins = await PreferenceInstruktur().getInstruktur();
    // idInstruktur = int.parse(ins!.idInstruktur!);
    isLoading = false;
    notifyListeners();
  }

  List<Instrumen> listInstrumen = [];
  Map<String, int> isCheckedMap = {};

  Future getInstrumen() async {
    isLoading = true;
    SiswaRepository.getInstrumen(NetworkURL.getInstrumen()).then((value) {
      if (value['code'] == 200) {
        for (Map<String, dynamic> i in value['data']) {
          final instrumen = Instrumen.fromJson(i);
          listInstrumen.add(instrumen);
          isCheckedMap[instrumen.idInstrumen!] = 0;
        }
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void toggleCheckbox(String idInstrumen, int nilaiInstrumen) {
    isCheckedMap[idInstrumen] = nilaiInstrumen;
    isInstrumenDirty = true;
    notifyListeners();
  }

  Future saveInstrumen() async {
    try {
      String nilaiInstrumen = jsonEncode(isCheckedMap);
      var response = await SiswaRepository.kirimInstrumen(
        NetworkURL.saveNilaiInstrumen(),
        id,
        nilaiInstrumen,
      );

      if (response['code'] == 200) {
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: Text(
            'Nilai instrumen berhasil dikirim',
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
      } else {
        final snackBar = SnackBar(
          content: Text(
            'Nilai instrumen gagal dikirim',
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
      }
    } catch (error) {
      print("Error: $error");
    }
  }

  Future getNilaiInstrumen() async {
    try {
      // ins = await PreferenceInstruktur().getInstruktur();
      // idInstruktur = int.parse(ins!.idInstruktur!);
      if (isCheckedMap.isEmpty) {
        isCheckedMap = await SiswaRepository.getNilaiInstrumen(
            NetworkURL.getNilaiInstrumen(),
            id.toString());

        listInstrumen.forEach((instrumen) {
          if (!isCheckedMap.containsKey(instrumen.idInstrumen)) {
            isCheckedMap[instrumen.idInstrumen!] = 0;
          }
        });
        notifyListeners();
      }
    } catch (error) {
      print("Error: $error");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> backConfirmDialog(BuildContext context) async {
    bool shouldClose = false;
    await showDialog(
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
                        shouldClose = true;
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
                        await saveInstrumen();
                        shouldClose = true;
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
    return shouldClose;
  }
}
