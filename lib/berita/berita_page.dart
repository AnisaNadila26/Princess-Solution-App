import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:princess_solution/isi_berita.dart';
import 'package:princess_solution/berita/berita_detail_page.dart';
import 'package:princess_solution/berita/berita_notifier.dart';
import 'package:princess_solution/network/network.dart';
import 'package:provider/provider.dart';

class BeritaPage extends StatefulWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  State<BeritaPage> createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BeritaNotifier(context),
      child: Consumer<BeritaNotifier>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Pengumuman',
              style: GoogleFonts.openSans(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: Wrap(
                    children: [
                      Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return BeritaDetailPage(isi: IsiBerita.info[index]);
                              }),
                            );
                          // onTap: () {
                          //   context.goNamed("detail",
                          //       params: {'pengumuman': index.toString()});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        // IsiBerita.info[index].judul,
                                        "${value.listBerita[index].judul}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        // IsiBerita.info[index].tanggal,
                                        "${value.listBerita[index].tanggal}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        // IsiBerita.info[index].isi,
                                        "${value.listBerita[index].isi}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: 
                                  // Image(
                                  //   image: AssetImage(
                                  //     IsiBerita.info[index].imageUrl,
                                  //   ),
                                  //   width: 100,
                                  // ),
                                  Image.network(
                                    NetworkURL.gambarBerita(value.listBerita[index].image), 
                                    width: 100,),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                // itemCount: info.length,
          
                //   return GestureDetector(
                //     onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) {
                //           return BeritaDetail(berita: info[index]);
                //         }),
                //       );
                //     },
                //     child: buildPengumumanCard(info[index]),
                //   );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(
                color: Colors.black,
                thickness: 0.2,
              ),
              itemCount: IsiBerita.info.length,
              // padding: const EdgeInsets.symmetric(vertical: 0)
            ),
          ),
        ),
      ),
    );
  }
}
