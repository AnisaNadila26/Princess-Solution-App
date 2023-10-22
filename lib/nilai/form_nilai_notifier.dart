import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/models/materi.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/repository/siswa_repository.dart';

class FormNilaiNotifier extends ChangeNotifier {
  final BuildContext context;
  final int id;
  final int idHari;

  FormNilaiNotifier(this.context, this.id, this.idHari) {
    isLoading = true;
    // getInstruktur();
    // getNilai();
    // getMateri();
    fetchData();
    notifyListeners();
  }

  Instruktur? ins;
  bool isLoading = true;
  bool isNilaiDirty = false;
  bool isCatatanDirty = false;

  // int id = 0;
  int idInstruktur = 0;
  // int idHari = 0;
  Map<String, Map<String, int?>> nilaiMap = {};
  TextEditingController catatanController = TextEditingController();
  String catatanValue = '';

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  Future fetchData() async {
    await getInstruktur();
    await getNilai();
    await getMateri();
    isLoading = false;
    notifyListeners();
  }

  getInstruktur() async {
    isLoading = true;
    ins = await PreferenceInstruktur().getInstruktur();
    idInstruktur = int.parse(ins!.idInstruktur!);
    // instruktur.text = ins?.nama ?? '';
    isLoading = false;
    notifyListeners();
  }

  // List<Materi> listMateri = [];
  // Future getMateri() async {
  //   if (!isLoading) {
  //     return;
  //   }
  //   try {
  //     var response = await SiswaRepository.getMateri(
  //         NetworkURL.getMateri(), idHari.toString());
  //     if (response['code'] == 200) {
  //       listMateri.clear();
  //       for (Map<String, dynamic> i in response['data']) {
  //         listMateri.add(Materi.fromJson(i));
  //       }
  //     }
  //     isLoading = false;
  //     notifyListeners();
  //   } catch (error) {
  //     print("Error: $error");
  //     isLoading = false;
  //     notifyListeners();
  //   }
  // }

  List<Materi> listMateri = [];
  Future getMateri() async {
    isLoading = true;
    SiswaRepository.getMateri(NetworkURL.getMateri(), idHari.toString()).then((value) {
      if (value['code'] == 200) {
        listMateri.clear();
        for (Map<String, dynamic> i in value['data']) {
          listMateri.add(Materi.fromJson(i));
        }
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }

  void updateNilai(String idMateri, int? nilai, String idKategori) {
    if (!nilaiMap.containsKey(idKategori)) {
      nilaiMap[idKategori] = {};
    }
    nilaiMap[idKategori]![idMateri] = nilai;
    isNilaiDirty = true;
    notifyListeners();
  }

  void updateCatatan(String newCatatan) {
    if (catatanValue != newCatatan) {
      catatanValue = newCatatan;
      isCatatanDirty = true;
      notifyListeners();
    }
  }

  cekNilai() async {
    if (keyForm.currentState!.validate()) {
      saveNilai();
    }
  }

  Future saveNilai() async {
    try {
      List<Map<String, dynamic>> nilaiList = [];
      nilaiMap = Map.fromEntries(nilaiMap.entries.toList()
        ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key))));
      for (String idKategori in nilaiMap.keys) {
        Map<String, int?>? nilaiInfo = nilaiMap[idKategori];
        if (nilaiInfo != null) {
          nilaiInfo = Map.fromEntries(nilaiInfo.entries.toList()
            ..sort((a, b) => int.parse(a.key).compareTo(int.parse(b.key))));

          Map<String, dynamic> nilaiData = {
            "id_kategori": idKategori,
            "data_nilai": nilaiInfo,
          };
          nilaiList.add(nilaiData);
        }
      }
      final String nilaiJson = jsonEncode(nilaiList);

      var response = await SiswaRepository.kirimNilai(
          NetworkURL.saveNilai(),
          id,
          // idInstruktur,
          nilaiJson,
          catatanController.text.trim(),
          idHari);
      if (response['code'] == 200) {
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: Text(
            'Penilaian berhasil dikirim',
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
            'Penilaian gagal dikirim',
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

  Future getNilai() async {
    try {
      // ins = await PreferenceInstruktur().getInstruktur();
      // idInstruktur = int.parse(ins!.idInstruktur!);

      if (nilaiMap.isEmpty) {
        final Map<String, dynamic>? result = await SiswaRepository.getNilai(
            NetworkURL.getNilai(),
            id.toString(),
            // idInstruktur.toString(),
            idHari.toString());

        Map<String, Map<String, int>> tempNilaiMap = {};
        String catatan = '';

        if (result != null) {
          if (result.containsKey('nilaiMap')) {
            tempNilaiMap = result['nilaiMap'];
          }
          if (result.containsKey('catatan')) {
            catatan = result['catatan'] ?? '';
          }

          if (tempNilaiMap.isNotEmpty) {
            nilaiMap = tempNilaiMap;

            listMateri.forEach((materi) {
              if (!nilaiMap.containsKey(materi.idKategori)) {
                nilaiMap[materi.idKategori!] = {};
              }

              if (!nilaiMap[materi.idKategori]!.containsKey(materi.idMateri!)) {
                nilaiMap[materi.idKategori]![materi.idMateri!] = null;
              }
            });

            catatanController.text = catatan;

            notifyListeners();
          } else {
            print("Data nilai tidak ditemukan");
          }
        } else {
          print("Data nilai dari repository bernilai null");
        }
      }
    } catch (error) {
      print("Error: $error");
      isLoading = false;
      notifyListeners();
    }
  }

  bool isFormDirty() {
    return isNilaiDirty || isCatatanDirty;
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
                        await cekNilai();
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
