import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class PrincessTheme {
  // static TextTheme lightTextTheme = TextTheme(
  //   bodyMedium: GoogleFonts.openSans(
  //       fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
  //   headline1: GoogleFonts.openSans(
  //       fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
  //   headline2: GoogleFonts.openSans(
  //       fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
  //   headline3: GoogleFonts.openSans(
  //       fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  //   headline6: GoogleFonts.openSans(
  //       fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  // );

  static ThemeData light() {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      primaryColor: Colors.white,
      brightness: Brightness.light,
      backgroundColor: Color.fromRGBO(28, 46, 82, 1.0),
      // colorScheme: ColorScheme.light(
      //   background: Color.fromRGBO(28, 46, 82, 1.0), // Atur latar belakang
      // ),
      dividerColor: Colors.white54,
      // textTheme: lightTextTheme,
    );
  }
}
