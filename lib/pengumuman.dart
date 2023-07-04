// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:princess_solution/isi_berita.dart';

// class Pengumuman extends StatefulWidget {
//   const Pengumuman({Key? key}) : super(key: key);

//   @override
//   State<Pengumuman> createState() => _PengumumanState();
// }

// class _PengumumanState extends State<Pengumuman> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Pengumuman',
//           style: GoogleFonts.openSans(
//               textStyle: Theme.of(context).textTheme.bodyMedium),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: SafeArea(
//         child: ListView.separated(
//           itemBuilder: (BuildContext context, int index) {
//             return Center(
//               child: Wrap(
//                 children: [
//                   Card(
//                     elevation: 0,
//                     color: Colors.transparent,
//                     child: InkWell(
//                       onTap: () {
//                         context.goNamed("detail",
//                             params: {'pengumuman': index.toString()});
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(5),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     info[index]['judul'],
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                   ),
//                                   Text(
//                                     info[index]['tanggal'],
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                   ),
//                                   SizedBox(height: 5),
//                                   Text(
//                                     info[index]['isi'],
//                                     overflow: TextOverflow.ellipsis,
//                                     maxLines: 2,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image(
//                                 image: AssetImage(info[index]['imageUrl']),
//                                 width: 100,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//             // itemCount: info.length,

//             //   return GestureDetector(
//             //     onTap: () {
//             //       Navigator.push(
//             //         context,
//             //         MaterialPageRoute(builder: (context) {
//             //           return BeritaDetail(berita: info[index]);
//             //         }),
//             //       );
//             //     },
//             //     child: buildPengumumanCard(info[index]),
//             //   );
//           },
//           separatorBuilder: (BuildContext context, int index) => const Divider(
//             color: Colors.black,
//             thickness: 0.2,
//           ),
//           itemCount: info.length,
//           // padding: const EdgeInsets.symmetric(vertical: 0)
//         ),
//       ),
//     );
//   }
// }