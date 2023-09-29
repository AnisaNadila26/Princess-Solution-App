import 'package:flutter/material.dart';
import 'package:princess_solution/profil/ubah_profil_ins_notifier.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/network/network.dart';

class UbahProfilInsPage extends StatelessWidget {
  const UbahProfilInsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => UbahProfilInsNotifier(context),
        child: Consumer<UbahProfilInsNotifier>(builder: (context, value, child) {
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
                                                NetworkURL.getProfilInstruktur(
                                                    value.ins!.fotoProfil!),
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
                                              borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20),
                                              ),
                                            ),
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 200,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
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
                                                          child: Text('Batal')),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            value.filepick();
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
                                                                  MdiIcons.image,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Text('Pilih Foto'),
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
                                                              SizedBox(
                                                                  height: 10),
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
                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
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
                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 105, 176, 1.0),
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
                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 105, 176, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                        width: 2.0,
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromRGBO(76, 105, 176, 1.0),
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
