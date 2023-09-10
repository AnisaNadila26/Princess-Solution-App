import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrincessTheme {
  static TextTheme darkTextTheme = TextTheme(
    headlineSmall: GoogleFonts.nunitoSans(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: GoogleFonts.nunitoSans(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
    bodyLarge: GoogleFonts.nunitoSans(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white),
    bodyMedium: GoogleFonts.nunitoSans(
        fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
  );

  static InputDecorationTheme customInput = InputDecorationTheme(
    labelStyle: TextStyle(color: Colors.white, fontSize: 14.0),
    floatingLabelStyle: TextStyle(color: Color.fromRGBO(76, 105, 176, 1.0)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color.fromRGBO(226, 235, 245, 1.0),
          width: 2,
        )),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color.fromRGBO(76, 105, 176, 1.0),
          width: 2,
        )),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color.fromRGBO(226, 235, 245, 1.0),
          width: 2,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Color.fromRGBO(76, 105, 176, 1.0),
          width: 2,
        )),
  );

  // static CardTheme customCard = CardTheme(
  //   shape: RoundedRectangleBorder(
  //     borderRadius: BorderRadius.circular(20.0),
  //     side: BorderSide(
  //       color: Color.fromRGBO(226, 235, 245, 1.0),
  //       width: 3.0,
  //     ),
  //   ),
  //   elevation: 2.0,
  //   color: Color.fromRGBO(31, 52, 73, 1.0),
  // );

  static ThemeData dark() {
    return ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(11, 13, 30, 1.0),
      inputDecorationTheme: customInput,
      cardColor: Color.fromRGBO(31, 52, 73, 1.0),
      textTheme: darkTextTheme,
      // cardTheme: customCard,
      dividerColor: Colors.white,
      // primarySwatch: Color.fromRGBO(226, 235, 245, 1.0),
      primaryColor: Colors.white,
      brightness: Brightness.dark,
      // backgroundColor: Color.fromRGBO(28, 46, 82, 1.0),
      // colorScheme: ColorScheme.light(
      //   background: Color.fromRGBO(28, 46, 82, 1.0), // Atur latar belakang
      // ),
      // textTheme: lightTextTheme,
    );
  }
}
