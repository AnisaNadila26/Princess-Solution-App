import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:princess_solution/splash_screen/splash_screen_page.dart';
// import 'routers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = PrincessTheme.light();

     return MaterialApp(
      theme: theme,
      home: const SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      // routerConfig: router,
    );

    // return MaterialApp.router(
    //   theme: theme,
    //   // home: const Home(),
    //   routerConfig: router,
    // );
  }
}
