// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter/material.dart';

// class CustomDialog extends StatelessWidget {
//   const CustomDialog({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return showModalBottomSheet(
//         backgroundColor: Colors.white,
//         context: context,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16), topRight: Radius.circular(16))),
//         builder: (context) {
//           return Container(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text("Loading"),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text("Tutup"))
//               ],
//             ),
//           );
//         });
//   }
// }

