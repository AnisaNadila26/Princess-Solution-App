import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
// import 'package:provider/provider.dart';
// import 'package:princess_solution/presensi/presensi_notifier.dart';

// class PresensiPage extends StatelessWidget {
//   const PresensiPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => PresensiNotifier(context),
//         child: Consumer<PresensiNotifier>(
//           builder: (context, value, child) => Scaffold(
//             appBar: AppBar(
//               title: Text(
//                 'Presensi',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//               flexibleSpace: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color.fromRGBO(12, 15, 39, 1.0),
//                       Color.fromRGBO(76, 105, 176, 1.0),
//                     ],
//                   ),
//                 ),
//               ),
//               centerTitle: true,
//             ),
//             body: SafeArea(
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(value.scannedText),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                       child: Text('Scan'),
//                       onPressed: () {
//                         value.scanBarcode();
//                       },
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () async {
                var res = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(),
                    ));
                setState(() {
                  if (res is String) {
                    result = res;
                  }
                });
              },
              child: const Text('Open Scanner'),
            ),
            Text('Barcode Result: $result'),
          ],
        ),
      ),
    );
  }
}