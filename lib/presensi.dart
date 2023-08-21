// import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// class Presensi extends StatefulWidget {
//   const Presensi({Key? key}) : super(key: key);

//   @override
//   State<Presensi> createState() => _PresensiState();
// }

// class _PresensiState extends State<Presensi> {
//   String text = 'Hasil Scan';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(text),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 child: Text('Scan'),
//                 onPressed: () async {
//                   String text = await FlutterBarcodeScanner.scanBarcode(
//                       "#ff6666", "Cancel", false, ScanMode.DEFAULT);
//                   setState(() {
//                     this.text = text;
//                   });
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }

// Stack(
//                                       children: [
//                                         Positioned.fill(
//                                           child: Container(
//                                             margin: EdgeInsets.all(5),
//                                             decoration: BoxDecoration(
//                                               border: Border.all(
//                                                   color: Colors.black),
//                                               shape: BoxShape.circle,
//                                               color: Colors.white),
//                                           )
//                                         ),
//                                         IconButton(
//                                           icon: Icon(
//                                             MdiIcons.pencilOutline,
//                                             size: 18,
//                                           ),
//                                           onPressed: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (context) {
//                                                 return AlertDialog(
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:BorderRadius.circular(20)
//                                                   ),
//                                                   content: Container(
//                                                     height: 300,
//                                                     width: 500,
//                                                     child: Form(
//                                                         key: value.keyForm,
//                                                         child: Center(
//                                                           child: Column(
//                                                             mainAxisAlignment:
//                                                                 MainAxisAlignment
//                                                                     .center,
//                                                             children: [
//                                                               RatingBar.builder(
//                                                                   initialRating:
//                                                                       value
//                                                                           .rating,
//                                                                   minRating: 1,
//                                                                   direction: Axis
//                                                                       .horizontal,
//                                                                   allowHalfRating:
//                                                                       true,
//                                                                   itemCount: 5,
//                                                                   itemPadding: EdgeInsets
//                                                                       .symmetric(
//                                                                           horizontal:
//                                                                               4),
//                                                                   itemBuilder:
//                                                                       (context,
//                                                                           index) {
//                                                                     return value
//                                                                         .emoticonForIndex(
//                                                                             index);
//                                                                   },
//                                                                   onRatingUpdate:
//                                                                       (rating) {
//                                                                     value.setRating(
//                                                                         rating);
//                                                                   }),
//                                                               SizedBox(
//                                                                   height: 10),
//                                                               Text(
//                                                                 'Rating: ${value.rating}',
//                                                               ),
//                                                               SizedBox(
//                                                                   height: 20),
//                                                               Padding(
//                                                                 padding: EdgeInsets
//                                                                     .symmetric(
//                                                                         horizontal:
//                                                                             20),
//                                                                 child:
//                                                                     TextFormField(
//                                                                   controller:
//                                                                       value
//                                                                           .review,
//                                                                   validator:
//                                                                       (value) {
//                                                                     if (value!
//                                                                         .isEmpty) {
//                                                                       return "Ulasan tidak boleh kosong";
//                                                                     } else {
//                                                                       return null;
//                                                                     }
//                                                                   },
//                                                                   maxLength:
//                                                                       255,
//                                                                   decoration:
//                                                                       InputDecoration(
//                                                                     hintText:
//                                                                         'Berikan ulasan Anda...',
//                                                                     border:
//                                                                         OutlineInputBorder(),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                   height: 20),
//                                                               ElevatedButton(
//                                                                 onPressed: () {
//                                                                   value
//                                                                       .cekRating();
//                                                                 },
//                                                                 child: Text(
//                                                                     'Kirim Penilaian'),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         )),
//                                                   ),
//                                                 );
//                                               }
//                                             );
//                                           },
//                                         ),
//                                       ])