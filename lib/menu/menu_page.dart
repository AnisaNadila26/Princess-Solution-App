import 'package:flutter/material.dart';
import 'package:princess_solution/menu/menu_notifier.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/dasbor/dasbor_page.dart';
import 'package:princess_solution/berita/berita_page.dart';
import 'package:princess_solution/presensi/presensi_page.dart';
import 'package:princess_solution/konsultasi/konsultasi_page.dart';
import 'package:princess_solution/profil/profil_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    int initialPageIndex = args?['page'] ?? 0;
    
    return ChangeNotifierProvider(
      create: (_) => MenuNotifier(context, initialPageIndex),
      child: Consumer<MenuNotifier>(
          builder: (context, value, child) => Scaffold(
                body: InkWell(
                  child: value.page == 0
                      ? DasborPage(
                          gantiPage: () => value.goPengumuman(),
                        )
                      : value.page == 1
                          ? const BeritaPage()
                          : value.page == 2
                              ? const PresensiPage()
                          : value.page == 3
                              ? const KonsultasiPage()
                              : value.page == 4
                                  ? ProfilPage()
                                  : const SizedBox(),
                ),
                bottomNavigationBar: SizedBox(
                  child: CurvedNavigationBar(
                      index: value.page,
                      color: Color.fromRGBO(76, 105, 176, 1.0),
                      buttonBackgroundColor: Color.fromRGBO(76, 105, 176, 1.0),
                      backgroundColor: Color.fromRGBO(11, 13, 30, 1.0),
                      animationDuration: Duration(milliseconds: 300),
                      items: [
                        Icon(MdiIcons.home, color: Colors.white, size: 30),
                        Icon(MdiIcons.newspaper, color: Colors.white, size: 30),
                        Icon(MdiIcons.qrcode, color: Colors.white, size: 30),
                        Icon(MdiIcons.chat, color: Colors.white, size: 30),
                        Icon(MdiIcons.account, color: Colors.white, size: 30),
                      ],
                      onTap: (index) {
                        value.gantiPage(index);
                      }),
                ),
              )),
    );
  }
}
