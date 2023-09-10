import 'package:flutter/material.dart';
import 'package:princess_solution/models/materi.dart';

class MateriItem extends StatelessWidget {
  final Materi materi;
  const MateriItem({required this.materi});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Text('Kategori'),
            //     Text('Materi'),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Flexible(child: Text('${materi.namaKategori ?? "Tidak ada kategori"}')),
            //     Flexible(child: Text('${materi.namaMateri ?? "Tidak ada materi"}')),
            //   ],
            // )
            Expanded(
              child: Text(
                '${materi.namaKategori ?? "Tidak ada kategori"}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Expanded(
              child: Text(
                '${materi.namaMateri ?? "Tidak ada materi"}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),  
          ],
        ),
      ),
    );
  }
}

