import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/models/data.dart';
import 'package:princess_solution/nilai/nilai_akhir_notifier.dart';
import 'package:provider/provider.dart';

class NilaiAkhirPage extends StatelessWidget {
  final Data item;
  NilaiAkhirPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NilaiAkhirNotifier(context),
      child: Consumer<NilaiAkhirNotifier>(builder: (context, value, child) {
        value.noRegistrasi = int.parse(item.noRegistrasi!);
        if (value.isLoading) {
          value.getNilaiAkhir(item.noRegistrasi.toString());
        }
        return WillPopScope(
          onWillPop: () async {
            bool shouldExit = await value.backConfirmDialog(context);
            if (shouldExit) {
              Navigator.pop(context);
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Penilaian Akhir',
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
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   icon: Icon(MdiIcons.keyboardBackspace),
              // ),
              actions: [
                InkWell(
                  onTap: () {
                    value.cekNilaiAkhir();
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
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                  child: Form(
                    key: value.keyForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Penilaian',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: value.penilaian,
                          onChanged: (text) {
                            value.isDataChanged = true;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Penilaian tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Emotional',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: value.emotional,
                          onChanged: (text) {
                            value.isDataChanged = true;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Emotional tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Kenyamanan',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: value.kenyamanan,
                          onChanged: (text) {
                            value.isDataChanged = true;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Kenyamanan tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 10),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Penguasaan',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextFormField(
                          controller: value.penguasaan,
                          onChanged: (text) {
                            value.isDataChanged = true;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Penguasaan tidak boleh kosong";
                            } else {
                              return null;
                            }
                          },
                          maxLines: null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
