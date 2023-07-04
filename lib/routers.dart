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


