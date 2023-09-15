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
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(12, 15, 39, 1.0),
                      Color.fromRGBO(76, 105, 176, 1.0),
                    ],
                  ),
                ),
              ),
              centerTitle: true,
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
                        image: AssetImage('konsultasi.png'),
                        width: 300,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Text(
                            'Ingin bertanya terkait kursus mengemudi?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Tidak dapat hadir kursus?',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Silahkan hubungi Admin',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
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
                                  color: Color.fromRGBO(76, 105, 176, 1.0),
                                  // border: Border.all(
                                  //   color: Colors.black,
                                  // ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Admin',
                                  style: Theme.of(context).textTheme.bodyMedium,
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