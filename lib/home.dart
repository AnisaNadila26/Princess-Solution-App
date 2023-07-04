import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'navBarItem.dart';
// import 'dasbor.dart';
// import 'pengumuman.dart';
// import 'presensi.dart';
// import 'konsultasi.dart';
// import 'profil.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const tabs = [
    ScaffoldWithBottomNavBar(
      initialLocation: "/dasbor",
      icon: Icon(MdiIcons.home),
      label: "Dasbor",
    ),
    ScaffoldWithBottomNavBar(
      initialLocation: "/pengumuman",
      icon: Icon(MdiIcons.newspaper),
      label: "Pengumuman",
    ),
    ScaffoldWithBottomNavBar(
      initialLocation: "/presensi",
      icon: Icon(MdiIcons.qrcode),
      label: "Presensi",
    ),
    ScaffoldWithBottomNavBar(
      initialLocation: "/konsultasi",
      icon: Icon(MdiIcons.chat),
      label: "Kosultasi",
    ),
    ScaffoldWithBottomNavBar(
      initialLocation: "/profil",
      icon: Icon(MdiIcons.account),
      label: "Profil",
    ),
  ];
  int get _currentindex => _locationToTabIndex(GoRouter.of(context).location);
  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    return index < 0 ? 0 : index;
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentindex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }
  // // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  // static List<Widget> pages = <Widget>[
  //   const Dasbor(),
  //   const Pengumuman(),
  //   const Presensi(),
  //   const Konsultasi(),
  //   const Profil(),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentindex,
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
        ],
        onTap: (index) => _onItemTapped(context, index),
      ),
      // bottomNavigationBar: Row(
      //   children: [
      //     buildNavBarItem(MdiIcons.home, "Dasbor", 0),
      //     buildNavBarItem(MdiIcons.newspaper, "Berita", 1),
      //     buildNavBarItem(MdiIcons.qrcode, "Presensi", 2),
      //     buildNavBarItem(MdiIcons.chat, "Konsultasi", 3),
      //     buildNavBarItem(MdiIcons.account, "Profil", 4),
      //   ],
      // ),
    );
  }

//   Widget buildNavBarItem(IconData icon, String judul, int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _onItemTapped(context, index);
//         });
//       },
//       child: Container(
//         height: 50,
//         width: MediaQuery.of(context).size.width / 5,
//         decoration: index == _currentindex
//             ? BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(width: 4, color: Colors.black),
//                 ),
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.white.withOpacity(0.4),
//                     Colors.black.withOpacity(0.02),
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                 ))
//             : BoxDecoration(),
//         child: Column(children: [
//           Icon(
//             icon,
//             color: index == _currentindex ? Colors.black : Colors.grey,
//           ),
//           Text(
//             "$judul",
//             style: TextStyle(
//               color: index == _currentindex ? Colors.black : Colors.grey,
//             ),
//           )
//         ]),
//         // (
//         //   icon,
//         //   color: index == _page ? Colors.black : Colors.grey,
//         // ),
//       ),
//     );
//   }
}
