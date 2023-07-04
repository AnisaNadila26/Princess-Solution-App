// import 'package:flutter/material.dart';
// import 'package:princess_solution/models/data.dart';
// import 'package:princess_solution/models/user.dart';
// import 'dio/dio_client.dart';

// class Konsultasi extends StatefulWidget {
//   const Konsultasi({Key? key}) : super(key: key);

//   @override
//   State<Konsultasi> createState() => _KonsultasiState();
// }

// class _KonsultasiState extends State<Konsultasi> {
//   final DioClient _client = DioClient();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Konsultasi")),
//       body: Center(
//         child: Text('Konsultasi'),
//         // child: FutureBuilder<User?>(
//         //     future: _client.getUser(nomorRegistrasi: '1'),
//         //     builder: (context, snapshot) {
//         //       if (snapshot.hasData) {
//         //         User? userInfo = snapshot.data;
//         //         if (userInfo != null) {
//         //           Data userData = userInfo.data;
//         //           return Column(
//         //             mainAxisSize: MainAxisSize.min,
//         //             children: [
//         //               Text(userData.kodeKendaraan),
//         //               Text(userData.instruktur),
//         //               Text(userData.jenisKendaraan),
//         //               Text(userData.paket),
//         //             ],
//         //           );
//         //         }
//         //       }
//         //     }),
//       ),
//     );
//   }
// }
