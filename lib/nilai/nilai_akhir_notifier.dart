import 'package:flutter/material.dart';
import 'package:princess_solution/models/instruktur.dart';
import 'package:princess_solution/models/nilaiAkhir.dart';
import 'package:princess_solution/network/network.dart';
import 'package:princess_solution/repository/siswa_repository.dart';

class NilaiAkhirNotifier extends ChangeNotifier {
  final BuildContext context;
  final int id;

  NilaiAkhirNotifier(this.context, this.id) {
    getNilaiAkhir();
  }

  Instruktur? ins;
  NilaiAkhir? na;
  // int id = 0;
  // int idInstruktur = 0;
  bool isLoading = true;
  bool isDataChanged = false;

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController penilaian = TextEditingController();
  TextEditingController emotional = TextEditingController();
  TextEditingController kenyamanan = TextEditingController();
  TextEditingController penguasaan = TextEditingController();

  cekNilaiAkhir() async {
    if (keyForm.currentState!.validate()) {
      saveNilaiAkhir();
    }
  }

  Future saveNilaiAkhir() async {
    try {
      var response = await SiswaRepository.kirimNilaiAkhir(
        NetworkURL.saveNilaiAkhir(),
        id,
        // idInstruktur,
        penilaian.text.trim(),
        emotional.text.trim(),
        kenyamanan.text.trim(),
        penguasaan.text.trim(),
      );

      if (response['code'] == 200) {
        var data = response['data'][0];
        na = NilaiAkhir.fromJson(data);
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: Text(
            'Nilai akhir berhasil dikirim',
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
            'Nilai akhir gagal dikirim',
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

  Future getNilaiAkhir() async {
    try {
      // ins = await PreferenceInstruktur().getInstruktur();
      // idInstruktur = int.parse(ins!.idInstruktur!);

      var response = await SiswaRepository.getNilaiAkhir(
        NetworkURL.getNilaiAkhir(),
        id.toString(),
        // idInstruktur.toString(),
      );

      if (response['code'] == 200) {
        if (response['data'] != null && response['data'].isNotEmpty) {
          na = NilaiAkhir.fromJson(response['data'][0]);
          if (na != null) {
            penilaian.text = na!.penilaian ?? '';
            emotional.text = na!.emotional ?? '';
            kenyamanan.text = na!.kenyamanan ?? '';
            penguasaan.text = na!.penguasaan ?? '';
          }
        }
      } else {
        print("Data nilai akhir tidak ditemukan");
      }

      isLoading = false;
      notifyListeners();
    } catch (error) {
      print("Data nilai akhir tidak ditemukan");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> backConfirmDialog(BuildContext context) async {
    bool shouldClose = false;
    if (isDataChanged) {
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
                          await cekNilaiAkhir();
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
    }
    return shouldClose;
  }
}
