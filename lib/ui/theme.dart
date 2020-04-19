import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final ThemeData defaultTheme = _buildTheme();
  static ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      textTheme: GoogleFonts.openSansTextTheme(
        base.textTheme.copyWith(
          headline1: TextStyle(
            color: textColor,
            fontSize: 52,
            fontWeight: FontWeight.w600,
            height: 1.3,
          ),
          headline2: TextStyle(
            backgroundColor: Colors.grey.shade200,
            color: accentColor,
            fontSize: 48,
            fontWeight: FontWeight.w800,
          ),
          subtitle1: TextStyle(
            fontSize: 20.0,
            height: 1.8,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade800,
          ),
          headline3: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 32,
          ),
          headline4: TextStyle(
            backgroundColor: Colors.grey.shade200,
            color: accentColor,
            fontWeight: FontWeight.w800,
            fontSize: 32,
          ),
          subtitle2: TextStyle(
            fontSize: 18.0,
            height: 1.2,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade800,
          ),
          headline5: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
          headline6: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w400,
            color: accentColor,
          ),
          caption: TextStyle(
            fontSize: 21.0,
            color: textColor,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300,
          ),
          overline: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w200,
            color: textColor,
            fontStyle: FontStyle.italic,
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            //fontWeight: FontWeight.,
            color: textColor,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: textColor,
            //fontWeight: FontWeight.w300,
          ),
          button: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
      ),
      accentColor: accentColor,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
      scaffoldBackgroundColor: Colors.white,
    );
  }
}

class CustomTextStyle {
  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontSize: 192.0);
  }
}

final primaryColor = Colors.white;
final accentColor = Color.fromARGB(255, 31, 229, 146);
final backgroundColor = Color.fromRGBO(248, 249, 250, 1);
final textColor = Color.fromRGBO(74, 74, 74, 1);
const marginRight = 70.0;
const marginLeft = 70.0;
const footerSize = 80.0;
const navBarHeight = 80.0;
const maxWidth = 1350.0;
