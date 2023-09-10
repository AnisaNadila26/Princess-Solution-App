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
                                                "Dasbor",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
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
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: Color.fromRGBO(
                                                226, 235, 245, 1.0),
                                            width: 3.0,
                                          ),
                                        ),
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
                                                Text(
                                                  value.users!.kodeKendaraan!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                VerticalDivider(
                                                  color: Theme.of(context)
                                                      .dividerColor,
                                                  thickness: 0.2,
                                                ),
                                                Text(
                                                  value.users!.namaInstruktur!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
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
                                              SizedBox(width: 5),
                                              Text(
                                                value.users!.jenisKendaraan!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              Spacer(),
                                              Icon(MdiIcons.clipboardList,
                                                  size: 20),
                                              SizedBox(width: 5),
                                              Text(
                                                value.users!.paket!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
                                              Spacer(),
                                              Icon(MdiIcons.clockTimeEight,
                                                  size: 20),
                                              SizedBox(width: 5),
                                              Text(
                                                '10.00-11.00',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge,
                                              ),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    'Jadwal',
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
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
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '15 Februari 2023',
                                              style: Theme.of(context).textTheme.bodyLarge,
                                            ),
                                            Icon(MdiIcons.chevronRight),
                                          ],
                                        ),
                                        Divider(
                                          color: Theme.of(context).dividerColor,
                                          thickness: 0.2,
                                        ),
                                        Text(
                                          'Tidak ada Jadwal',
                                          style: Theme.of(context).textTheme.bodyMedium,
                                        ),
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
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                gantiPage!();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Lainnya',
                                                    style: Theme.of(context).textTheme.bodyLarge,
                                                  ),
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
                                                    'Belum ada berita',
                                                    style: Theme.of(context).textTheme.bodyMedium,
                                                )),
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
                                                            color: Theme.of(
                                                                    context)
                                                                .dividerColor,
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
