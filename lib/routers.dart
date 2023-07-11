// import 'package:go_router/go_router.dart';
// import 'package:princess_solution/home.dart';
// import 'package:princess_solution/dasbor/dasbor_page.dart';
// import 'package:princess_solution/pengumuman.dart';
// import 'package:princess_solution/berita_detail.dart';
// import 'package:princess_solution/presensi.dart';
// import 'package:princess_solution/konsultasi.dart';
// import 'package:princess_solution/profil.dart';

// final GoRouter router = GoRouter(
//   initialLocation: '/',
//   routes: <RouteBase>[
//     ShellRoute(
//       builder: (context, state, child) {
//         return Home(
//           child: child,
//         );
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: '/',
//           pageBuilder: ((context, state) =>
//               NoTransitionPage(child: const Dasbor())),
//         ),
//         GoRoute(
//           path: '/dasbor',
//           pageBuilder: ((context, state) =>
//               NoTransitionPage(child: const Dasbor())),
//         ),
//         GoRoute(
//           path: "/pengumuman",
//           name: "Pengumuman",
//           pageBuilder: ((context, state) =>
//               NoTransitionPage(child: const Pengumuman())),
//           routes: [
//             GoRoute(
//               path: "detail/:pengumuman",
//               name: "Detail",
//               builder: (context, state) => BeritaDetail(
//                 no: state.params['pengumuman']!,
//               ),
//             )
//           ]
//         ),
//         GoRoute(
//           path: '/presensi',
//           pageBuilder: ((context, state) =>
//               NoTransitionPage(child: const Presensi())),
//         ),
//         GoRoute(
//           path: '/konsultasi',
//           pageBuilder: ((context, state) =>
//               NoTransitionPage(child: const Konsultasi())),
//         ),
//         GoRoute(
//           path: '/profil',
//           pageBuilder: ((context, state) =>
//               NoTransitionPage(child: const Profil())),
//         ),
//       ],
//     ),
//   ],
// );

// import 'package:flutter/material.dart';
// import 'package:princess_solution/login/login_notifier.dart';
// import 'package:princess_solution/menu/menu_page.dart';
// import 'package:provider/provider.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => LoginNotifier(context),
//       child: Consumer<LoginNotifier>(
//         builder: (context, value, child) => SafeArea(
//             child: Scaffold(
//           body: MediaQuery.of(context).size.width > 600
//               ? Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: double.infinity,
//                         child: Image(
//                           image: AssetImage('assets/login.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 400,
//                       child: ListView(
//                         children: [
//                           SizedBox(
//                             height: 120,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                     top: -80,
//                                     left: -80,
//                                     child: Container(
//                                       height: 180,
//                                       width: 180,
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Colors.amber),
//                                     )),
//                                 Positioned(
//                                     top: -30,
//                                     right: -30,
//                                     child: Row(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Container(
//                                           height: 20,
//                                           width: 20,
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.amber),
//                                         ),
//                                         Container(
//                                           height: 100,
//                                           width: 100,
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Colors.amber),
//                                         ),
//                                       ],
//                                     )),
//                                 Center(
//                                   child: Image(
//                                     image: AssetImage('assets/login.png'),
//                                     color: Colors.amber,
//                                     height: 80,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 16,
//                           ),
//                           Container(
//                             margin: EdgeInsets.symmetric(horizontal: 32),
//                             padding: EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(16),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                     offset: Offset(2, 2),
//                                     blurRadius: 5,
//                                     color:
//                                         Colors.grey[300] ?? Colors.transparent)
//                               ],
//                             ),
//                             child: Form(
//                               key: value.keyForm,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: [
//                                   Text(
//                                     "Log In",
//                                     style: TextStyle(
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 16,
//                                   ),
//                                   TextFormField(
//                                     controller: value.email,
//                                     validator: (e) {
//                                       if (e!.isEmpty) {
//                                         return "Wajib diisi";
//                                       } else {
//                                         return null;
//                                       }
//                                     },
//                                     decoration: InputDecoration(
//                                         hintText: "Phone or Email Address"),
//                                   ),
//                                   SizedBox(
//                                     height: 16,
//                                   ),
//                                   TextFormField(
//                                     obscureText: true,
//                                     controller: value.password,
//                                     validator: (e) {
//                                       if (e!.isEmpty) {
//                                         return "Wajib diisi";
//                                       } else {
//                                         return null;
//                                       }
//                                     },
//                                     decoration:
//                                         InputDecoration(hintText: "Password"),
//                                   ),
//                                   SizedBox(
//                                     height: 16,
//                                   ),
//                                   SizedBox(
//                                     height: 50,
//                                     width: 100,
//                                     child: InkWell(
//                                         onTap: () {
//                                           value.cekLogin();
//                                         },
//                                         child: Container(
//                                             alignment: Alignment.center,
//                                             decoration: BoxDecoration(
//                                               color: Color.fromRGBO(0, 0, 0, 1),
//                                               // border: Border.all(
//                                               //   color: Colors.black,
//                                               // ),
//                                               borderRadius:
//                                                   BorderRadius.circular(20),
//                                             ),
//                                             child: Text(
//                                               'Masuk',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                             ))),
//                                     // child: TextButton(
//                                     //     style: TextButton.styleFrom(
//                                     //       foregroundColor: Colors.white,
//                                     //       backgroundColor: Colors.black,
//                                     //     ),
//                                     //     onPressed: () {
//                                     //       Navigator.pushAndRemoveUntil(
//                                     //           context,
//                                     //           MaterialPageRoute(
//                                     //               builder: (context) =>
//                                     //                   const MenuPage()),
//                                     //           (route) => false);
//                                     //     },
//                                     //     child: Container(
//                                     //       padding: EdgeInsets.all(16),
//                                     //       child: Text('Masuk'),
//                                     //     )),
//                                   ),
//                                   SizedBox(
//                                     height: 16,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       TextButton(
//                                           onPressed: () {},
//                                           child: Text(
//                                             "Lupa Sandi?",
//                                             style: TextStyle(
//                                               color: Colors.amber,
//                                             ),
//                                           ))
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 )
//               : ListView(
//                   children: [
//                     SizedBox(
//                       height: 120,
//                       child: Stack(
//                         children: [
//                           Positioned(
//                               top: -80,
//                               left: -80,
//                               child: Container(
//                                 height: 180,
//                                 width: 180,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.amber),
//                               )),
//                           Positioned(
//                               top: -30,
//                               right: -30,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Container(
//                                     height: 20,
//                                     width: 20,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.amber),
//                                   ),
//                                   Container(
//                                     height: 100,
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.amber),
//                                   ),
//                                 ],
//                               )),
//                           Center(
//                             child: Image(
//                               image: AssetImage('assets/login.png'),
//                               color: Colors.amber,
//                               height: 80,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Container(
//                       margin: EdgeInsets.symmetric(horizontal: 32),
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               offset: Offset(2, 2),
//                               blurRadius: 5,
//                               color: Colors.grey[300] ?? Colors.transparent)
//                         ],
//                       ),
//                       child: Form(
//                         key: value.keyForm,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             Text(
//                               "Log In",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 16,
//                             ),
//                             TextFormField(
//                               controller: value.email,
//                               validator: (e) {
//                                 if (e!.isEmpty) {
//                                   return "Wajib diisi";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               decoration: InputDecoration(
//                                   hintText: "Phone or Email Address"),
//                             ),
//                             SizedBox(
//                               height: 16,
//                             ),
//                             TextFormField(
//                               obscureText: true,
//                               controller: value.password,
//                               validator: (e) {
//                                 if (e!.isEmpty) {
//                                   return "Wajib diisi";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                               decoration: InputDecoration(hintText: "Password"),
//                             ),
//                             SizedBox(
//                               height: 16,
//                             ),
//                             SizedBox(
//                               height: 16,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Lupa Sandi?",
//                                       style: TextStyle(
//                                         color: Colors.amber,
//                                       ),
//                                     ))
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//         )),
//       ),
//     );
//   }
// }



