import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:princess_solution/profil/ubah_profil_notifier.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/network/network.dart';

class UbahProfilPage extends StatefulWidget {
  const UbahProfilPage({super.key});

  @override
  State<UbahProfilPage> createState() => _UbahProfilPageState();
}

class _UbahProfilPageState extends State<UbahProfilPage> {
  File? imageFile;

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
                          value.ubahProfil();
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
                    child: Form(
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
                                // child: Image.network(
                                //         NetworkURL.getProfil(
                                //             value.users!.fotoProfil),
                                //         width: 120,
                                //         height: 120,
                                //         fit: BoxFit.cover,
                                //       ),
                                child: imageFile != null
                                    ? Image.file(imageFile!)
                                    : Image.network(
                                        NetworkURL.getProfil(
                                            value.users!.fotoProfil),
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Positioned(
                                bottom: 2,
                                right: -2,
                                child: Stack(children: [
                                  Positioned.fill(
                                      child: Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
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
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight:
                                                      Radius.circular(16))),
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                              height: 200,
                                              child: Center(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      "Pilih Foto Profil",
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        OutlinedButton.icon(
                                                          onPressed: () {
                                                            takePhoto(
                                                                ImageSource
                                                                    .camera);
                                                          },
                                                          icon: Icon(
                                                            MdiIcons.camera,
                                                            size: 24,
                                                            color: Colors.black,
                                                          ),
                                                          label: Text(
                                                            "Kamera",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                        ),
                                                        OutlinedButton.icon(
                                                          onPressed: () {
                                                            takePhoto(
                                                                ImageSource
                                                                    .gallery);
                                                          },
                                                          icon: Icon(
                                                            MdiIcons
                                                                .imageSizeSelectActual,
                                                            size: 24,
                                                            color: Colors.black,
                                                          ),
                                                          label: Text(
                                                            "Galeri",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          style: OutlinedButton
                                                              .styleFrom(
                                                                  side: BorderSide(
                                                                      color: Colors
                                                                          .white)),
                                                        ),
                                                      ],
                                                    ),
                                                    // Row(
                                                    //   mainAxisAlignment: MainAxisAlignment.center,
                                                    //   children: [
                                                    //     SizedBox(
                                                    //       child: Row(
                                                    //         children: [
                                                    //           Icon(
                                                    //             MdiIcons.camera,
                                                    //             size: 24),
                                                    //           SizedBox(
                                                    //             width: 10,
                                                    //           ),
                                                    //           Text(
                                                    //             "Kamera",
                                                    //             style: TextStyle(
                                                    //                 fontSize: 14),
                                                    //           ),
                                                    //         ],
                                                    //       ),
                                                    //     ),
                                                    //     SizedBox(
                                                    //       width: 30,
                                                    //     ),
                                                    //     SizedBox(
                                                    //       child: Row(
                                                    //         children: [
                                                    //           Icon(
                                                    //             MdiIcons.imageSizeSelectActual,
                                                    //             size: 24
                                                    //           ),
                                                    //           SizedBox(
                                                    //             width: 10,
                                                    //           ),
                                                    //           Text(
                                                    //             "Galeri",
                                                    //             style: TextStyle(
                                                    //               fontSize: 14
                                                    //             )
                                                    //           ),
                                                    //         ],
                                                    //       ),
                                                    //     )
                                                    //   ],
                                                    // ),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    FilledButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: Text("Batal"))
                                                  ],
                                                ),
                                              ),
                                            );
                                          });
                                      setState(() {});
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
                                decoration: InputDecoration(labelText: "Nama"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.tanggalLahir,
                                decoration:
                                    InputDecoration(labelText: "Tanggal Lahir"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.email,
                                decoration: InputDecoration(labelText: "Email"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.telpon,
                                decoration:
                                    InputDecoration(labelText: "Nomor Telepon"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.pekerjaan,
                                decoration:
                                    InputDecoration(labelText: "Pekerjaan"),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: value.alamat,
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

  takePhoto(ImageSource source) async {
    XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      // return image.path;
      setState(() {
        imageFile = File(image.path);
      });
    } else {
      return '';
    }
  }
}
