import 'package:flutter/material.dart';
// import 'package:princess_solution/isi_berita.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/berita/berita_detail_notifier.dart';
import 'package:princess_solution/models/berita.dart';
import 'package:provider/provider.dart';
import 'package:princess_solution/network/network.dart';

class BeritaDetailPage extends StatelessWidget {
  final Berita isi;
  BeritaDetailPage({Key? key, required this.isi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BeritaDetailNotifier(context),
      child: Consumer<BeritaDetailNotifier>(
        builder: (context, value, child) => Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(MdiIcons.keyboardBackspace),
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(20),
                    child: Container(
                      color: Colors.white,
                      child: Center(
                        child: Text(isi.judul!, style: TextStyle(fontWeight: FontWeight.w600),),
                      ),
                      width: double.maxFinite,
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                    ),
                  ),
                  expandedHeight: 500,
                  pinned: true,
                  backgroundColor: Colors.grey,
                  flexibleSpace: FlexibleSpaceBar(
                      // title: Text(widget.berita.judul),
                      background: Image.network(
                        NetworkURL.gambarBerita(isi.image!),
                    // image: AssetImage(isi.image),
                    fit: BoxFit.cover,
                  )),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(MdiIcons.calendar),
                              SizedBox(width: 5),
                              Text(isi.tanggal!)
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            isi.isi!,
                            textAlign: TextAlign.justify,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
