import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static const double paddin = 20.0;
  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(
        blurRadius: 2, spreadRadius: 1, color: Colors.black.withOpacity(0.09))
  ];
  // colors
  static const Color primaryColor = Color(0xFF126B6F);

  static const Color secondaryColor = Color(0xffE9F1F3);
  static const Color whiteColor = Color(0xffFEFEFE);
  static const Color offwhite = Color(0xffF6F1EB);
  static const Color darkblue = Color(0xFF191F2D);
  //
  // fonts
  static const TextStyle titleTextStyle = TextStyle(
    fontSize: 26,
  );
  static const TextStyle bodyTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600);

  static const TextStyle ayahTextStyle = TextStyle(
      fontFamily: "UthmanTN",
      fontSize: 18,
      height: 2,
      color: AppStyle.primaryColor,
      fontWeight: FontWeight.w500);
  //

  //themes
  static ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.mulish().fontFamily,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(),
  );
  //
}

class ApiConstants {
  static String baseUrl = 'https://django-api-production.up.railway.app';
  static String usersEndpoint = '/kidsvideos';
}
