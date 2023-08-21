import 'package:flutter/material.dart';
import 'package:princess_solution/profil/ubah_profil_notifier.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/network/network.dart';

class UbahProfilPage extends StatelessWidget {
  const UbahProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UbahProfilNotifier(context),
        child: Consumer<UbahProfilNotifier>(
            builder: (context, value, child) => Scaffold(
                  appBar: AppBar(
                    title: Text(
                      'Ubah Profil',
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
                          value.cekUpdate();
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
                  body: SafeArea(
                    child: value.isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Form(
                            key: value.keyForm,
                            child: ListView(children: [
                              Container(
                                alignment: Alignment.topCenter,
                                margin: EdgeInsets.symmetric(vertical: 30),
                                child: Stack(children: [
                                  CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Colors.grey.shade800,
                                    child: ClipOval(
                                        child: value.file != null
                                            ? Image.memory(
                                                value.fileToDisplay!,
                                                width: 120,
                                                height: 120,
                                                fit: BoxFit.cover,
                                              )
                                            : (value.fotoProfil == '')
                                                ? Image.asset(
                                                    'assets/defaultProfile.png',
                                                    width: 120,
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                  )
                                                : Image.network(
                                                    NetworkURL.getProfil(value
                                                        .users!.fotoProfil!),
                                                    width: 120,
                                                    height: 120,
                                                    fit: BoxFit.cover,
                                                  )),
                                  ),
                                  Positioned(
                                      bottom: 2,
                                      right: -2,
                                      child: Stack(children: [
                                        Positioned.fill(
                                            child: Container(
                                          margin: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                        )),
                                        IconButton(
                                          icon: Icon(
                                            MdiIcons.pencilOutline,
                                            size: 18,
                                          ),
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(20),
                                                  ),
                                                ),
                                                builder:
                                                    (BuildContext context) {
                                                  return SizedBox(
                                                    height: 200,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Padding(
                                                          padding:const EdgeInsets.all(10),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text('Batal')),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                value
                                                                    .filepick();
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      MdiIcons
                                                                          .image,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height:10),
                                                                  Text('Pilih Foto'),
                                                                ],
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                value.deleteFotoProfil();
                                                              },
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    width: 50,
                                                                    height: 50,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Icon(
                                                                      MdiIcons
                                                                          .trashCanOutline,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  SizedBox(height:10),
                                                                  Text('Hapus Foto'),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                        ),
                                      ]))
                                ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: value.nama,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field tidak boleh kosong";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration:
                                          InputDecoration(labelText: "Nama"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: value.tanggalLahir,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field tidak boleh kosong";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Tanggal Lahir",
                                          suffixIcon: IconButton(
                                            icon: Icon(MdiIcons.calendarMonth),
                                            onPressed: () {
                                              value.selectDate(context);
                                            },
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: value.email,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field tidak boleh kosong";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration:
                                          InputDecoration(labelText: "Email"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: value.telpon,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field tidak boleh kosong";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Nomor Telepon"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: value.pekerjaan,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field tidak boleh kosong";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                          labelText: "Pekerjaan"),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      controller: value.alamat,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Field tidak boleh kosong";
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration:
                                          InputDecoration(labelText: "Alamat"),
                                    ),
                                    SizedBox(height: 30),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                  ),
                )));
  }
}
