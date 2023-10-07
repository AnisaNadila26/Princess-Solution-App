import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/nilai/nilai_notifier.dart';
import 'package:provider/provider.dart';

class NilaiPage extends StatelessWidget {
  const NilaiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String query = '';
    return ChangeNotifierProvider(
        create: (_) => NilaiNotifier(context),
        child: Consumer<NilaiNotifier>(
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                'Penilaian',
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
              // actions: [
              //   IconButton(
              //       onPressed: () {
              //         showDialog(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return AlertDialog(
              //                 title: Text('Cari Siswa'),
              //                 content: TextField(
              //                   onChanged: (value) {
              //                     query = value;
              //                   },
              //                 ),
              //                 actions: [
              //                   TextButton(
              //                     child: Text('Cari'),
              //                     onPressed: () {
              //                       Navigator.of(context).pop();
              //                       value.searchSiswa(query);
              //                     },
              //                   )
              //                 ],
              //               );
              //             });
              //       },
              //       icon: Icon(
              //         MdiIcons.accountSearch,
              //         color: Colors.white,
              //       )),
              //   SizedBox(
              //     width: 10,
              //   )
              // ],
            ),
            body: SafeArea(
                child: Column(
              children: [
                value.tabButton(),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: TextField(
                          controller: value.searchController,
                          onChanged: (value) {
                            query = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari nama siswa',
                            suffixIcon: query.isNotEmpty
                            ? IconButton(
                              icon: Icon(MdiIcons.closeCircle),
                              onPressed: () {
                                value.searchController.clear();
                                query = '';
                                value.searchSiswa(''); 
                              },
                            )
                            : IconButton(
                                icon: Icon(MdiIcons.magnify),
                                onPressed: () {
                                  value.searchSiswa(query);
                                },
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: value.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.currentTabIndex == 0
                          ? value.buildSiswaList(value.filteredSiswaListManual)
                          : value.buildSiswaList(value.filteredSiswaListMatic),
                ),
              ],
            )),
          ),
        ));
  }
}
