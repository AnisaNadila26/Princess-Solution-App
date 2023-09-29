import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/nilai/form_nilai_notifier.dart';
import 'package:princess_solution/nilai/materi_item.dart';
import 'package:provider/provider.dart';

class FormNilaiPage extends StatelessWidget {
  final Data item;
  final String hari;
  const FormNilaiPage({Key? key, required this.item, required this.hari})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => FormNilaiNotifier(context),
        child: Consumer<FormNilaiNotifier>(builder: (context, value, child) {
          value.noRegistrasi = int.parse(item.noRegistrasi!);
          value.idHari = int.parse(hari);
          // value.setInitialValues(item);
          value.getNilai(item.noRegistrasi.toString(),
              value.idInstruktur.toString(), value.idHari.toString());
          if (value.isLoading) {
            value.getMateri(hari);
          }
          return WillPopScope(
            onWillPop: () async {
              if (value.isFormDirty()) {
                bool shouldExit = await value.backConfirmDialog(context);
                if (shouldExit) {
                  Navigator.pop(context);
                }
              }
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Materi Belajar dan Poin Penilaian',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(12, 15, 39, 1.0),
                        Color.fromRGBO(76, 105, 176, 1.0),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                // leading: IconButton(
                //   onPressed: () async {
                //     if (value.isFormDirty()) {
                //       bool shouldExit = await value.backConfirmDialog(context);
                //       if (shouldExit) {
                //         Navigator.pop(context);
                //       } else {
                //         Navigator.pop(context);
                //       }
                //     }
                //   },
                //   icon: Icon(MdiIcons.keyboardBackspace),
                // ),
                actions: [
                  InkWell(
                    onTap: () {
                      value.cekNilai();
                    },
                    child: Icon(
                      MdiIcons.contentSave,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: value.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Instruktur'),
                                      Text('Nama Siswa'),
                                      Text('Kode Kendaraan'),
                                      Text('Paket'),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(value.ins!.nama!),
                                      Text(item.nama!),
                                      Text(item.kodeKendaraan!),
                                      Text(item.paket!),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(width: 30),
                              Form(
                                key: value.keyForm,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'Hari $hari',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        side: BorderSide(
                                          color: Color.fromRGBO(
                                              226, 235, 245, 1.0),
                                          width: 3.0,
                                        ),
                                      ),
                                      elevation: 2.0,
                                      color: Theme.of(context).cardColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'KETERANGAN',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      '1 : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    Text(
                                                      'Tidak Baik',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '2 : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    Text(
                                                      'Kurang Baik',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '3 : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    Text(
                                                      'Sedang',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '4 : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    Text(
                                                      'Baik',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '5 : ',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                    Text(
                                                      'Sangat Baik',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'Kategori',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        )),
                                        Expanded(
                                            child: Text(
                                          'Materi',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        )),
                                        Expanded(
                                            child: Column(
                                          children: [
                                            Text(
                                              'Poin',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  '1',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                Text(
                                                  '2',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                Text(
                                                  '3',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                Text(
                                                  '4',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                Text(
                                                  '5',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                              ],
                                            )
                                          ],
                                        )),
                                      ],
                                    ),
                                    Column(
                                      children: value.listMateri.isNotEmpty
                                          ? value.listMateri.map((materi) {
                                              Map<String, int?>? nilaiData =
                                                  value.nilaiMap.containsKey(
                                                          materi.idKategori)
                                                      ? value.nilaiMap[
                                                          materi.idKategori]
                                                      : null;
                                              int? selectedValue = nilaiData !=
                                                          null &&
                                                      nilaiData.containsKey(
                                                          materi.idMateri)
                                                  ? nilaiData[materi.idMateri]!
                                                  : null;
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    children: [
                                                      Flexible(
                                                        child: MateriItem(
                                                          materi: materi,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      for (int i = 1;
                                                          i <= 5;
                                                          i++)
                                                        Radio<int>(
                                                          value: i,
                                                          groupValue:
                                                              selectedValue,
                                                          onChanged:
                                                              (int? nilai) {
                                                            if (nilai != null) {
                                                              value.updateNilai(
                                                                materi
                                                                    .idMateri!,
                                                                nilai,
                                                                materi
                                                                    .idKategori!,
                                                              );
                                                            }
                                                          },
                                                        )
                                                    ],
                                                  ),
                                                  Divider(
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                    thickness: 0.2,
                                                  ),
                                                ],
                                              );
                                            }).toList()
                                          : [Text('Tidak ada data materi.')],
                                    ),
                                    TextFormField(
                                      controller: value.catatanController,
                                      onChanged: (newCatatan) {
                                        value.updateCatatan(newCatatan);
                                      },
                                      maxLength: 255,
                                      decoration: InputDecoration(
                                        hintText: 'Catatan',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
