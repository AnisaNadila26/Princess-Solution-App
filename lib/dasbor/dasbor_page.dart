import 'package:flutter/material.dart';
// import 'package:princess_solution/dasbor/komponen_dasbor/content.dart';
// import 'package:princess_solution/dasbor/komponen_dasbor/top.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/dasbor/dasbor_notifier.dart';
import 'package:princess_solution/berita/berita_item.dart';
import 'package:provider/provider.dart';
// import 'package:go_router/go_router.dart';

class DasborPage extends StatelessWidget {
  final Function? gantiPage;
  const DasborPage({super.key, this.gantiPage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DasborNotifier(context),
      child: Consumer<DasborNotifier>(
          builder: (context, value, child) => Scaffold(
                appBar: value.onAppBar
                    ? AppBar(
                        title: Text(
                          "Dasbor",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        centerTitle: true,
                        backgroundColor: Colors.black,
                        actions: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                MdiIcons.cog,
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
                            height: 370,
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
                                              // Color.fromRGBO(119, 154, 184, 1.0),
                                              Color.fromRGBO(76, 105, 176, 1.0),
                                              Color.fromRGBO(28, 46, 82, 1.0),
                                              Colors.black,
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
                                                "Dasbor",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    MdiIcons.cog,
                                                    color: Colors.white,
                                                  )),
                                            ]),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: 120,
                                      left: 50,
                                      right: 50,
                                      child: Container(
                                        height: 220,
                                        width: 320,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/mobil.png',
                                            width: 250,
                                            fit: BoxFit.cover,
                                          ),
                                          IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(value
                                                    .users!.kodeKendaraan!),
                                                VerticalDivider(
                                                  color: Colors.black,
                                                  thickness: 0.2,
                                                ),
                                                Text(value
                                                    .users!.namaInstruktur!),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Spacer(),
                                              Icon(MdiIcons.steering, size: 20),
                                              Text(
                                                  value.users!.jenisKendaraan!),
                                              Spacer(),
                                              Icon(MdiIcons.clipboardList,
                                                  size: 20),
                                              Text(value.users!.paket!),
                                              Spacer(),
                                              Icon(MdiIcons.clockTimeEight,
                                                  size: 20),
                                              Text('10.00-11.00'),
                                              Spacer(),
                                            ],
                                          ),
                                        ]),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                Card(
                                  elevation: 2.0,
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Jadwal'),
                                            Icon(MdiIcons.chevronRight),
                                          ],
                                        ),
                                        Text('15 Februari 2023'),
                                        Divider(
                                          color: Colors.black,
                                          thickness: 0.2,
                                        ),
                                        Text('Tidak ada Jadwal'),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Berita Terbaru',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                gantiPage!();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('Lainnya'),
                                                  Icon(MdiIcons.arrowRight),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: value.listBerita.isEmpty
                                            ? [
                                                Center(
                                                    child: Text(
                                                        'Belum ada berita')),
                                              ]
                                            : value.listBerita
                                                .take(3)
                                                .map((berita) => Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        BeritaItem(
                                                            berita: berita),
                                                        Divider(
                                                            color: Colors.black,
                                                            thickness: 0.2),
                                                      ],
                                                    ))
                                                .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                                // Card(
                                //   elevation: 2.0,
                                //   color: Colors.grey,
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(10),
                                //     child: InkWell(
                                //       onTap: () {
                                //         gantiPage!();
                                //       },
                                //       // onTap: () {
                                //       //   context.go('/pengumuman');
                                //       // },
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           Row(
                                //             mainAxisAlignment:
                                //                 MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text('Berita'),
                                //               Icon(MdiIcons.chevronRight),
                                //             ],
                                //           ),
                                //           Divider(
                                //             color: Colors.black,
                                //             thickness: 0.2,
                                //           ),
                                //           Text('Belum ada Berita'),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
