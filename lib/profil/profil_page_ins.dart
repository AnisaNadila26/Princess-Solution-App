import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/profil/profil_notifier_ins.dart';
import 'package:princess_solution/profil/ubah_profil_ins_page.dart';
import 'package:provider/provider.dart';
import 'package:princess_solution/network/network.dart';

class ProfilPageInstruktur extends StatelessWidget {
  const ProfilPageInstruktur({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfilNotifierInstruktur(context),
      child: Consumer<ProfilNotifierInstruktur>(
          builder: (context, value, child) => Scaffold(
                appBar: value.onAppBar
                    ? AppBar(
                        title: Text(
                          "Profil",
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
                        actions: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return UbahProfilInsPage();
                                  }),
                                );
                              },
                              icon: Icon(
                                MdiIcons.accountEdit,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    : PreferredSize(
                        child: SizedBox(), preferredSize: Size(0, 0)),
                body: SafeArea(
                    child: NotificationListener<ScrollStartNotification>(
                  onNotification: (scrollStart) {
                    final metrics = scrollStart.metrics;
                    if (metrics.hasPixels) {
                      bool isTop = metrics.pixels > 50;
                      if (isTop) {
                        value.showAppBar();
                      } else {
                        value.hideAppBar();
                      }
                    }
                    return true;
                  },
                  child: value.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView(children: [
                          SizedBox(
                            height: 320,
                            child: Container(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 240,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color.fromRGBO(12, 15, 39, 1.0),
                                              Color.fromRGBO(76, 105, 176, 1.0),
                                            ],
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          )),
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        margin:
                                            EdgeInsets.only(top: 20, right: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(
                                              "Profil",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall,
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                      return UbahProfilInsPage();
                                                    }),
                                                  );
                                                },
                                                icon: Icon(
                                                  MdiIcons.accountEdit,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 170,
                                      left: 50,
                                      right: 50,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.grey.shade800,
                                        child: ClipOval(
                                          child: Image.network(
                                            value.ins!.fotoProfil!.isNotEmpty
                                                ? NetworkURL
                                                    .getProfilInstruktur(
                                                        value.ins!.fotoProfil!)
                                                : 'assets/defaultProfile.png',
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                      color: Color.fromRGBO(226, 235, 245, 1.0),
                                      width: 3.0,
                                    ),
                                  ),
                                  elevation: 2.0,
                                  color: Theme.of(context).cardColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(MdiIcons.account),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nama',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              SizedBox(height: 3),
                                              Text(
                                                value.ins!.nama!,
                                                style: Theme.of(context).textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                      color: Color.fromRGBO(226, 235, 245, 1.0),
                                      width: 3.0,
                                    ),
                                  ),
                                  elevation: 2.0,
                                  color: Theme.of(context).cardColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(MdiIcons.emailCheck),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Email',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              SizedBox(height: 3),
                                              Text(
                                                value.ins!.email!,
                                                style: Theme.of(context).textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(height: 10),
                                // Card(
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(20.0),
                                //     side: BorderSide(
                                //       color: Color.fromRGBO(226, 235, 245, 1.0),
                                //       width: 3.0,
                                //     ),
                                //   ),
                                //   elevation: 2.0,
                                //   color: Theme.of(context).cardColor,
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(10),
                                //     child: Row(
                                //       mainAxisAlignment:
                                //           MainAxisAlignment.start,
                                //       children: [
                                //         Icon(MdiIcons.phone),
                                //         SizedBox(width: 15),
                                //         Expanded(
                                //           child: Column(
                                //             crossAxisAlignment:
                                //                 CrossAxisAlignment.start,
                                //             children: [
                                //               Text(
                                //                 'Nomor Telepon',
                                //                 style: Theme.of(context)
                                //                     .textTheme
                                //                     .bodyLarge,
                                //               ),
                                //               SizedBox(height: 3),
                                //               Text(
                                //                 value.ins!.telpon!,
                                //                 style: Theme.of(context).textTheme.bodyMedium,
                                //               ),
                                //             ],
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                SizedBox(height: 10),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: BorderSide(
                                      color: Color.fromRGBO(226, 235, 245, 1.0),
                                      width: 3.0,
                                    ),
                                  ),
                                  elevation: 2.0,
                                  color: Theme.of(context).cardColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(MdiIcons.briefcase),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Usia',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                              SizedBox(height: 3),
                                              Text(
                                                value.ins!.usia!.toString(),
                                                style: Theme.of(context).textTheme.bodyMedium,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 45,
                                  width: 75,
                                  child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                backgroundColor:
                                                    Theme.of(context).cardColor,
                                                content: Container(
                                                  height: 200,
                                                  width: 200,
                                                  child: Transform.translate(
                                                    offset: Offset(0, -50),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .cardColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                    color: Color.fromRGBO(226, 235, 245, 1.0),
                                                                    width: 3.0,
                                                                  )),
                                                          child: Icon(
                                                            MdiIcons
                                                                .logoutVariant,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        // Icon(MdiIcons.logoutVariant),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          'Keluar',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleLarge,
                                                        ),
                                                        SizedBox(height: 20),
                                                        Text(
                                                          'Apakah anda yakin ingin keluar?',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyLarge,
                                                        ),
                                                        SizedBox(height: 20),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            FilledButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                'Batal',
                                                                style: Theme.of(context).textTheme.bodyMedium,
                                                              ),
                                                              style: FilledButton
                                                                  .styleFrom(
                                                                backgroundColor:
                                                                    Colors.grey,
                                                              ),
                                                            ),
                                                            FilledButton(
                                                              onPressed: () {
                                                                value.logout();
                                                              },
                                                              child: Text(
                                                                'Keluar',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyMedium,
                                                              ),
                                                              style: FilledButton
                                                                  .styleFrom(
                                                                backgroundColor:
                                                                    Color.fromRGBO(
                                                                        76,
                                                                        105,
                                                                        176,
                                                                        1.0),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                76, 105, 176, 1.0),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            'Keluar',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ))),
                                ),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ]),
                )),
              )),
    );
  }
}
