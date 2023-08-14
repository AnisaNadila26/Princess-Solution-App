import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:princess_solution/presensi/presensi_notifier.dart';

class PresensiPage extends StatelessWidget {
  const PresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => PresensiNotifier(context),
        child: Consumer<PresensiNotifier>(
          builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text('Presensi'),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(value.scannedText),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      child: Text('Scan'),
                      onPressed: () {
                        value.scanBarcode();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
