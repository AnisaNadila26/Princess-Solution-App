import 'package:flutter/material.dart';
import 'package:princess_solution/menu/menu_notifier.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:princess_solution/dasbor/dasbor_page.dart';
import 'package:princess_solution/berita/berita_page.dart';
import 'package:princess_solution/profil/profil_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuNotifier(context),
      child: Consumer<MenuNotifier>(
          builder: (context, value, child) => Scaffold(
                body: InkWell(
                  child: value.page == 0
                      ? DasborPage(
                          gantiPage: () => value.goPengumuman(),
                        )
                      : value.page == 1
                          ? const BeritaPage()
                          : value.page == 4
                              ? const ProfilPage()
                              // : value.page == 2
                              //     ? const Pengumuman()
                              : const SizedBox(),
                ),
                bottomNavigationBar: SizedBox(
                  child: CurvedNavigationBar(
                      color: Colors.black,
                      buttonBackgroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      animationDuration: Duration(milliseconds: 300),
                      items: [
                        Icon(MdiIcons.home, color: Colors.white, size: 30),
                        Icon(MdiIcons.newspaper, color: Colors.white, size: 30),
                        Icon(MdiIcons.qrcode, color: Colors.white, size: 30),
                        Icon(MdiIcons.chat, color: Colors.white, size: 30),
                        Icon(MdiIcons.account, color: Colors.white, size: 30),
                        // IconButton(
                        //     onPressed: value.gantiPage(0),
                        //     icon: Icon(MdiIcons.home,
                        //         color: Colors.white, size: 30)),
                        // IconButton(
                        //     onPressed: value.gantiPage(1),
                        //     icon: Icon(MdiIcons.newspaper,
                        //         color: Colors.white, size: 30)),
                        // IconButton(
                        //     onPressed: value.gantiPage(2),
                        //     icon: Icon(MdiIcons.qrcode,
                        //         color: Colors.white, size: 30)),
                        // IconButton(
                        //     onPressed: value.gantiPage(3),
                        //     icon: Icon(MdiIcons.chat,
                        //         color: Colors.white, size: 30)),
                        // IconButton(
                        //     onPressed: value.gantiPage(4),
                        //     icon: Icon(MdiIcons.account,
                        //         color: Colors.white, size: 30)),
                      ],
                      onTap: (index) {
                        value.gantiPage(index);
                      }),
                ),
              )),
    );
  }
}
