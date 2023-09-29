import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/models/hari.dart';
import 'package:princess_solution/nilai/nilai_akhir_page.dart';
import 'package:princess_solution/nilai/nilai_detail_notifier.dart';
import 'package:princess_solution/nilai/form_nilai_page.dart';
import 'package:princess_solution/models/data.dart';
import 'package:provider/provider.dart';
import 'package:princess_solution/network/network.dart';

class NilaiDetailPage extends StatelessWidget {
  final Data isi;
  NilaiDetailPage({Key? key, required this.isi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NilaiDetailNotifier(context),
      child: Consumer<NilaiDetailNotifier>(
          builder: (context, value, child) => Container(
                height: 500,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                child: Transform.translate(
                  offset: Offset(0, -40),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundColor: Theme.of(context).cardColor,
                              child: ClipOval(
                                child: Image.network(
                                  isi.fotoProfil!.isNotEmpty
                                      ? NetworkURL.getProfilSiswa(
                                          isi.fotoProfil!)
                                      : 'assets/defaultProfile.png',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              isi.nama!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Text(
                              isi.alamat!,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(
                              color: Color.fromRGBO(226, 235, 245, 1.0),
                              width: 3.0,
                            ),
                          ),
                          color: Theme.of(context).cardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          'Paket',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        Text(
                                          isi.paket!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 50,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Jenis Kendaraan',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        Text(
                                          isi.jenisKendaraan!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 50,
                                      color: Theme.of(context).dividerColor,
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'Kode Kendaraan',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                        Text(
                                          isi.kodeKendaraan!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: Icon(MdiIcons.numeric),
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  226, 235, 245, 1.0),
                                              width: 3.0,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).cardColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          isi.noRegistrasi!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: Icon(MdiIcons.cakeVariant),
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  226, 235, 245, 1.0),
                                              width: 3.0,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).cardColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          isi.ttl!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: Icon(MdiIcons.phone),
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  226, 235, 245, 1.0),
                                              width: 3.0,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).cardColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          isi.telpon!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: Center(
                                            child: Icon(MdiIcons.briefcase),
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color.fromRGBO(
                                                  226, 235, 245, 1.0),
                                              width: 3.0,
                                            ),
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).cardColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          isi.pekerjaan!,
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Penilaian',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ]),
                        ),
                        for (Hari hari in value.listHari)
                          InkWell(
                            onTap: () async {
                              // await value.getMateri(hari.hari!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return FormNilaiPage(
                                    item: isi,
                                    hari: hari.hari!, // Pass the selected day
                                  );
                                }),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: BorderSide(
                                  color: Color.fromRGBO(226, 235, 245, 1.0),
                                  width: 3.0,
                                ),
                              ),
                              color: Theme.of(context).cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Hari ${hari.hari}',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(MdiIcons.chevronRight),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return NilaiAkhirPage(
                                  item: isi,
                                );
                              }),
                            );
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Color.fromRGBO(226, 235, 245, 1.0),
                                width: 3.0,
                              ),
                            ),
                            color: Theme.of(context).cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Penilaian Akhir',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(MdiIcons.chevronRight),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
