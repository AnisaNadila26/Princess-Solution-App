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
          value.setInitialValues(item);
          value.getNilai(item.noRegistrasi.toString(), value.idInstruktur.toString());
          if (!value.isMateriLoaded) {
            value.getMateri(hari);
            value.isMateriLoaded = true;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Materi Belajar dan Poin Penilaian',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(MdiIcons.keyboardBackspace),
              ),
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
                  padding: const EdgeInsets.all(16.0),
                  child: value.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text('Instruktur'),
                      //     Text('Nama Siswa'),
                      //     Text('Kode Kendaraan'),
                      //     Text('Paket'),
                      //   ],
                      // ),
                      // SizedBox(width: 30),
                      Form(
                        key: value.keyForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: value.instruktur,
                              decoration: InputDecoration(
                                labelText: 'Instruktur',
                                enabled: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.only(right: 50),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: value.namaSiswa,
                              decoration: InputDecoration(
                                labelText: 'Nama Siswa',
                                enabled: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.only(right: 50),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: value.kodeKendaraan,
                              decoration: InputDecoration(
                                labelText: 'Kode Kendaraan',
                                enabled: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.only(right: 50),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: value.paket,
                              decoration: InputDecoration(
                                labelText: 'Paket',
                                enabled: false,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.only(right: 50),
                              ),
                            ),
                            SizedBox(height: 20),
                            Card(
                              color: Colors.grey,
                              child: Column(
                                children: [
                                  Text('KETERANGAN'),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Text('1 : '),
                                          Text('Tidak Baik'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('2 : '),
                                          Text('Kurang Baik'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('3 : '),
                                          Text('Sedang'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('4 : '),
                                          Text('Baik'),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text('5 : '),
                                          Text('Sangat Baik'),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(child: Text('Kategori')),
                                Expanded(child: Text('Materi')),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Text('Poin'),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('1'),
                                        Text('2'),
                                        Text('3'),
                                        Text('4'),
                                        Text('5'),
                                      ],
                                    )
                                  ],
                                )),
                              ],
                            ),
                            Column(
                              children: value.listMateri.isNotEmpty
                                  ? value.listMateri.map((materi) {
                                      int? selectedValue =
                                          value.nilaiMap[materi.idMateri];
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
                                              for (int i = 1; i <= 5; i++)
                                                Radio<int>(
                                                  value: i,
                                                  groupValue: selectedValue,
                                                  onChanged: (int? nilai) {
                                                    if (nilai != null) {
                                                      value.updateNilai(
                                                          materi.idMateri!,
                                                          nilai);
                                                    }
                                                  },
                                                )
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.black,
                                            thickness: 0.2,
                                          ),
                                        ],
                                      );
                                    }).toList()
                                  : [Text('Tidak ada data materi.')],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
