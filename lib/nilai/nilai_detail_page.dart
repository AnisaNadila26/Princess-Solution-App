import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/models/hari.dart';
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
                    color: Colors.black,
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
                              backgroundColor: Colors.black,
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
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              isi.alamat!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.grey,
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
                                        Text('Paket'),
                                        Text(isi.paket!),
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 50,
                                      color: Colors.black,
                                    ),
                                    Column(
                                      children: [
                                        Text('Jenis Kendaraan'),
                                        Text(isi.jenisKendaraan!),
                                      ],
                                    ),
                                    Container(
                                      width: 2,
                                      height: 50,
                                      color: Colors.black,
                                    ),
                                    Column(
                                      children: [
                                        Text('Kode Kendaraan'),
                                        Text(isi.kodeKendaraan!),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                  color: Colors.grey),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(isi.noRegistrasi!),
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
                                                  color: Colors.grey),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(isi.ttl!),
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
                                                  color: Colors.grey),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(isi.telpon!),
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
                                                  color: Colors.grey),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(isi.pekerjaan!),
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
                                Text('Penilaian',
                                    style: TextStyle(color: Colors.white)),
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
                                  borderRadius: BorderRadius.circular(20)),
                              elevation: 2.0,
                              color: Colors.grey,
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
                                              Text('Hari ${hari.hari}'),
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
