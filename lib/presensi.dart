import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:flutter/services.dart';

class Presensi extends StatefulWidget {
  const Presensi({Key? key}) : super(key: key);

  @override
  State<Presensi> createState() => _PresensiState();
}

class _PresensiState extends State<Presensi> {
  String text = 'Hasil Scan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: Text('Scan'),
                onPressed: () async {
                  String text = await FlutterBarcodeScanner.scanBarcode(
                      "#ff6666", "Cancel", false, ScanMode.DEFAULT);
                  setState(() {
                    this.text = text;
                  });
                })
          ],
        ),
      ),
    );
  }
}
