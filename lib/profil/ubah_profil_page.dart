import 'dart:io';
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
        child: Consumer<UbahProfilNotifier>(builder: (context, value, child) {
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
                  'Ubah Profil',
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
                                    child: value.filePaths.isNotEmpty
                                        ? Image.file(
                                            File(value.filePaths),
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
                                                NetworkURL.getProfilSiswa(
                                                    value.users!.fotoProfil!),
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
                                            color: Color.fromRGBO(
                                                226, 235, 245, 1.0),
                                            width: 3.0,
                                          ),
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).cardColor),
                                    )),
                                    IconButton(
                                      icon: Icon(
                                        MdiIcons.pencilOutline,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                            ),
                                            backgroundColor:
                                                Theme.of(context).cardColor,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 200,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Batal',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodyMedium,
                                                          )),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            value.pickFile();
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Theme.of(context)
                                                                            .cardColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color: Color.fromRGBO(
                                                                              226,
                                                                              235,
                                                                              245,
                                                                              1.0),
                                                                          width:
                                                                              3.0,
                                                                        )),
                                                                child: Icon(
                                                                  MdiIcons
                                                                      .image,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                'Pilih Foto',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            value
                                                                .deleteFotoProfil();
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: 50,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: Theme.of(context)
                                                                            .cardColor,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        border:
                                                                            Border.all(
                                                                          color: Color.fromRGBO(
                                                                              226,
                                                                              235,
                                                                              245,
                                                                              1.0),
                                                                          width:
                                                                              3.0,
                                                                        )),
                                                                child: Icon(
                                                                  MdiIcons
                                                                      .trashCanOutline,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                'Hapus Foto',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                              ),
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: value.nama,
                                  onChanged: (text) {
                                    value.isDataChanged = true;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Nama tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Nama",
                                    border: InputBorder.none,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: value.tanggalLahir,
                                  onChanged: (text) {
                                    value.isDataChanged = true;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Tanggal lahir tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelText: "Tanggal Lahir",
                                      border: InputBorder.none,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              226, 235, 245, 1.0),
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(76, 105, 176, 1.0),
                                          width: 2.0,
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              226, 235, 245, 1.0),
                                          width: 2.0,
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Color.fromRGBO(76, 105, 176, 1.0),
                                          width: 2.0,
                                        ),
                                      ),
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
                                  onChanged: (text) {
                                    value.isDataChanged = true;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Email tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Email",
                                    border: InputBorder.none,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: value.telpon,
                                  onChanged: (text) {
                                    value.isDataChanged = true;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Nomor telepon tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Nomor Telepon",
                                    border: InputBorder.none,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: value.pekerjaan,
                                  onChanged: (text) {
                                    value.isDataChanged = true;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Pekerjaan tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Pekerjaan",
                                    border: InputBorder.none,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: value.alamat,
                                  onChanged: (text) {
                                    value.isDataChanged = true;
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Alamat tidak boleh kosong";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    labelText: "Alamat",
                                    border: InputBorder.none,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ]),
                      ),
              ),
            ),
          );
        }));
  }
}
