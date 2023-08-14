import 'package:flutter/material.dart';
import 'package:princess_solution/berita/berita_detail_page.dart';
import 'package:princess_solution/models/berita.dart';
import 'package:princess_solution/network/network.dart';

class BeritaItem extends StatelessWidget {
  final Berita berita;
  const BeritaItem({required this.berita});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return BeritaDetailPage(isi: berita);
            }),
          );
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
                      berita.judul,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      berita.tanggal,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      berita.isi,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  NetworkURL.gambarBerita(berita.image),
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
