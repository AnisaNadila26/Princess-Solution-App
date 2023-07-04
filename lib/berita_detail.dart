// import 'package:flutter/material.dart';
// import 'package:princess_solution/isi_berita.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class BeritaDetail extends StatelessWidget {
//   String no;
//   BeritaDetail({Key? key, required this.no}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(MdiIcons.keyboardBackspace),
//               ),
//               bottom: PreferredSize(
//                 preferredSize: Size.fromHeight(20),
//                 child: Container(
//                   color: Colors.white,
//                   child: Center(
//                     child: Text(info[int.parse(no)]['judul']),
//                   ),
//                   width: double.maxFinite,
//                   padding: EdgeInsets.only(top: 5, bottom: 10),
//                 ),
//               ),
//               expandedHeight: 500,
//               pinned: true,
//               backgroundColor: Colors.grey,
//               flexibleSpace: FlexibleSpaceBar(
//                   // title: Text(widget.berita.judul),
//                   background: Image(
//                 image: AssetImage(info[int.parse(no)]['imageUrl']),
//                 fit: BoxFit.cover,
//               )),
//             ),
//             SliverToBoxAdapter(
//               child: Padding(
//                   padding: EdgeInsets.all(15),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Icon(MdiIcons.calendar),
//                           Text(info[int.parse(no)]['tanggal'])
//                         ],
//                       ),
//                       Text(
//                         info[int.parse(no)]['isi'],
//                         textAlign: TextAlign.justify,
//                       )
//                     ],
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
