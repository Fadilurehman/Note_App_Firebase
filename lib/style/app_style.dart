import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xFFe2e2fe);
  static Color mainColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065FF);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.roboto(fontSize: 16.0, fontWeight: FontWeight.bold);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.bold);
}

class CustomClr {
  static Color kblue = Colors.blue;
  static Color deepPurple = Colors.deepPurple;
  static Color kwhite = Colors.white;
  static Color kwhite70 = Colors.white70;
  static Color kblack = Colors.black;
  static Color kred = Colors.redAccent;
  static Color kgreen = Colors.green;
  static Color kbackground = const Color.fromRGBO(209, 196, 233, 1);
}

class CustomSize {
  static var commonRadius = BorderRadius.circular(15);
}

class CustomFuction {
  static texttStyle({required weight, required color, required double size}) {
    return TextStyle(fontSize: size, fontWeight: weight, color: color);
  }
}

class CustomHeight {
  static var commonHeight = const SizedBox(height: 20);
  static var height10 = const SizedBox(height: 10);
}
