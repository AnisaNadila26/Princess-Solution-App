import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class PresensiNotifier extends ChangeNotifier {
  String scannedText = 'Hasil Scan';

  PresensiNotifier(BuildContext context);

  Future scanBarcode() async {
    String text = await FlutterBarcodeScanner.scanBarcode(
      "#ff6666", "Cancel", false, ScanMode.DEFAULT);
    if (text != '-1') {
      scannedText = text;
      notifyListeners();
    } else {
      scannedText = 'Scan dibatalkan';
      notifyListeners();
    }
  }
}
