import 'package:flutter/material.dart';
import 'package:princess_solution/konsultasi/konsultasi_notifier.dart';
import 'package:provider/provider.dart';

class KonsultasiPage extends StatelessWidget {
  const KonsultasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => KonsultasiNotifier(context),
      child: Consumer<KonsultasiNotifier> (
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Konsultasi',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: SafeArea(
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Image(
                        image: AssetImage('assets/konsultasi.png'),
                        width: 300,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text('Ingin bertanya terkait kursus mengemudi?'),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Tidak dapat hadir kursus?'),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Silahkan hubungi Admin'),
                          SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: InkWell(
                              onTap: () {
                                value.launchWhatsapp();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Admin',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              )
                            ),
                          ),
                        ],
                      ),
                    )
                  ]
                )
              ],
            )
          // SizedBox(
          //   height: 50,
          //   width: 100,
          //   child: InkWell(
          //       onTap: () {
          //         value.launchWhatsapp();
          //       },
          //       child: Container(
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             color: Color.fromRGBO(0, 0, 0, 1),
          //             // border: Border.all(
          //             //   color: Colors.black,
          //             // ),
          //             borderRadius: BorderRadius.circular(20),
          //           ),
          //           child: Text(
          //             'Admin',
          //             style: TextStyle(
          //               color: Colors.white,
          //             ),
          //           ))),
                
          //     ),
            ),
        ),
      )
    );
  }
}