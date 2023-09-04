import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/data/preference_ins.dart';
import 'package:princess_solution/models/materi.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/repository/siswa_repository.dart';

class FormNilaiNotifier extends ChangeNotifier {
  final BuildContext context;

  FormNilaiNotifier(this.context) {
    getInstruktur();
    notifyListeners();
  }

  Instruktur? ins;
  bool isLoading = true;
  bool isMateriLoaded = false;
  List<Materi> listMateri = [];

  int noRegistrasi = 0;
  int idInstruktur = 0;
  Map<String, int?> nilaiMap = {};

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController instruktur = TextEditingController();
  TextEditingController namaSiswa = TextEditingController();
  TextEditingController kodeKendaraan = TextEditingController();
  TextEditingController paket = TextEditingController();

  getInstruktur() async {
    isLoading = true;
    ins = await PreferenceInstruktur().getInstruktur();
    idInstruktur = int.parse(ins!.idInstruktur!);
    instruktur.text = ins?.nama ?? '';
    isLoading = false;
    notifyListeners();
  }

  void setInitialValues(Data data) {
    namaSiswa.text = data.nama ?? '';
    kodeKendaraan.text = data.kodeKendaraan ?? '';
    paket.text = data.paket ?? '';
  }

  Future getMateri(String hari) async {
    if (isMateriLoaded) {
      return;
    }

    isLoading = true;
    try {
      SiswaRepository.getMateri(NetworkURL.getMateri(), hari).then((value) {
        if (value['code'] == 200) {
          listMateri.clear();
          for (Map<String, dynamic> i in value['data']) {
            listMateri.add(Materi.fromJson(i));
          }
        }
        isLoading = false;
        isMateriLoaded = true;
        notifyListeners();
      });
    } catch (error) {
      print("Error: $error");
      isLoading = false;
      notifyListeners();
    }
  }

  void updateNilai(String idMateri, int? nilai) {
    nilaiMap[idMateri] = nilai!;
    // print("Updated nilaiMap: $nilaiMap");
    notifyListeners();
  }

  Future getNilai(String noRegistrasi, String idInstruktur) async {
    try {
      if (nilaiMap.isEmpty) {
        nilaiMap = await SiswaRepository.getNilai(
          NetworkURL.getNilai(), 
          noRegistrasi, 
          idInstruktur
        );

        listMateri.forEach((materi) {
          if (!nilaiMap.containsKey(materi.idMateri)) {
            nilaiMap[materi.idMateri!] = null;
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

  cekNilai() {
    if (keyForm.currentState!.validate()) {
      saveNilai();
    }
  }

  Future saveNilai() async {
    try {
      final Map<String, dynamic> nilaiData = {};
      for (String idMateri in nilaiMap.keys) {
        int? nilai = nilaiMap[idMateri];
        if (nilai != null) {
          nilaiData[idMateri] = nilai;
        }
      }
      final String nilaiJson = jsonEncode(nilaiData);

      var response = await SiswaRepository.kirimNilai(
        NetworkURL.saveNilai(),
        noRegistrasi,
        idInstruktur,
        nilaiJson,
      );
      if (response['code'] == 200) {
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: Text('Penilaian berhasil dikirim'),
          backgroundColor: Colors.black,
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
          content: Text('Penilaian gagal dikirim'),
          backgroundColor: Colors.black,
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

  // Future<void> saveNilai() async {
  //   try {
  //     final List<int> idMateriList = [];
  //     final List<int> nilaiList = [];

  //     for (String idMateri in nilaiMap.keys) {
  //       final nilai = nilaiMap[idMateri];
  //       if (nilai != null) {
  //         idMateriList.add(int.parse(idMateri));
  //         nilaiList.add(nilai);
  //       }
  //     }

  //     var response = await SiswaRepository.kirimNilai(
  //       NetworkURL.saveNilai(),
  //       noRegistrasi,
  //       idInstruktur,
  //       nilaiList,
  //       idMateriList,
  //     );

  //     if (response['code'] == 200) {
  //       Nilai nilai = Nilai.fromJson(response['data']);
  //       PreferenceInstruktur().setNilai(nilai);
  //       Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => NilaiPage(),
  //           settings: RouteSettings(
  //             arguments: {'page': 2},
  //           ),
  //         ),
  //         (route) => false,
  //       );
  //       final snackBar = SnackBar(
  //         content: Text('Penilaian berhasil dikirim'),
  //         backgroundColor: Colors.black,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(50),
  //         elevation: 30,
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     } else {
  //       final snackBar = SnackBar(
  //         content: Text('Penilaian gagal dikirim'),
  //         backgroundColor: Colors.black,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20),
  //         ),
  //         behavior: SnackBarBehavior.floating,
  //         margin: EdgeInsets.all(50),
  //         elevation: 30,
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } catch (error) {
  //     print("Error: $error");
  //   }
  // }

  // getMateri(String hari) async {
  //   isLoading = true;
  //   notifyListeners();
  //   try {
  //     final response =
  //         await SiswaRepository.getMateri(NetworkURL.getMateri(), hari);
  //     if (response['code'] == 200) {
  //       final materi = response['data'] as List<dynamic>;

  //       listMateri = materi.map((item) => Materi.fromJson(item)).toList();
  //     }
  //   } catch (error) {
  //     listMateri = [];
  //   }
  //   isLoading = false;
  //   notifyListeners();
  // }

  // Future getMateri(String hari) async {
  //   isLoading = true;
  //   SiswaRepository.getMateri(NetworkURL.getMateri(), hari).then((value) {
  //     if (value['code'] == 200) {
  //       for (Map<String, dynamic> i in value['data']) {
  //         listMateri.add(Materi.fromJson(i));
  //       }
  //       isLoading = false;
  //       notifyListeners();
  //     } else {
  //       isLoading = false;
  //       notifyListeners();
  //     }
  //   });
  // }
}
