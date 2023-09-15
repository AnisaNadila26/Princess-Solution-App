import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/dasbor/dasbor_notifier_ins.dart';
import 'package:princess_solution/berita/berita_item.dart';
import 'package:provider/provider.dart';

class DasborPageInstruktur extends StatelessWidget {
  final Function? gantiPage;
  const DasborPageInstruktur({super.key, this.gantiPage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DasborNotifierInstruktur(context),
      child: Consumer<DasborNotifierInstruktur>(
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
                                        )
                                      ),
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
                                                style: Theme.of(context).textTheme.headlineSmall,
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
                                      top: 190,
                                      left: 50,
                                      right: 50,
                                      child: Container(
                                          height: 100,
                                          width: 200,
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
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Center(
                                                      child: Icon(MdiIcons.accountGroup),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                                        width: 3.0,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      color: Theme.of(context).cardColor
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        value.ins!.jumlahSiswa!.toString(),
                                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Jumlah Siswa',
                                                        style: Theme.of(context).textTheme.bodyLarge,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Center(
                                                      child:
                                                          Icon(MdiIcons.star),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color.fromRGBO(226, 235, 245, 1.0),
                                                        width: 3.0,
                                                      ),
                                                      shape: BoxShape.circle,
                                                      color: Theme.of(context).cardColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        value.ins!.rating!.toString(),
                                                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        'Rating',
                                                        style: Theme.of(context).textTheme.bodyLarge,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          )))
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '15 Februari 2023',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
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
                                              style: Theme.of(context).textTheme.titleLarge,
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
