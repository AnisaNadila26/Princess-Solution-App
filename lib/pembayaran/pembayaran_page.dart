import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/pembayaran/pembayaran_notifier.dart';
import 'package:provider/provider.dart';

class PembayaranPage extends StatelessWidget {
  PembayaranPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PembayaranNotifier(context),
      child: Consumer<PembayaranNotifier>(
        builder: (context, value, child) => Scaffold(
          body: SafeArea(
              child: value.isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(MdiIcons.keyboardBackspace),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 50),
                          child: Text(
                            'TAGIHAN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2.0,
                            color: Colors.grey,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text(
                                    'Detail Tagihan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text('No. Registrasi '),
                                      Text(value.users!.noRegistrasi!),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(value.users!.nama!),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Paket ${value.users!.paket!}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                      'Instruktur ${value.users!.namaInstruktur!}'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Sisa Tagihan'),
                                      Text(
                                        'Rp ${value.users!.sisaPembayaran!}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 100,
                                        child: InkWell(
                                          onTap: () {},
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Text(
                                              'Bayar',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            )
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
        ),
      ),
    );
  }
}
