import 'package:flutter/material.dart';

class MyTheme {
  static final ThemeData defaultTheme = _buildTheme();
  static ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    final primaryColor = Colors.white;
    final accentColor = Color.fromARGB(255, 31, 229, 146);
    final backgroundColor = Color.fromARGB(50, 31, 229, 146);

    return base.copyWith(
      textTheme: TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w800,
          fontFamily: 'Open sans',
          color: Colors.black,
          fontSize: 50,
          height: 1.5,
        ),
        headline2: TextStyle(
          backgroundColor: Colors.grey.shade200,
          color: accentColor,
          fontWeight: FontWeight.w800,
          fontFamily: 'Open sans',
          fontSize: 50,
          height: 0.9,
        ),
        headline3: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 32,
          height: 1.5,
          fontFamily: 'Open sans',
        ),
        headline4: TextStyle(
          backgroundColor: Colors.grey.shade200,
          color: accentColor,
          fontWeight: FontWeight.w600,
          fontSize: 32,
          height: 1.5,
          fontFamily: 'Open sans',
        ),
        headline5: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: 'Open sans',
        ),
        headline6: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          //backgroundColor: Colors.grey.shade200,
          color: accentColor,
          fontFamily: 'Open sans',
        ),
        caption: TextStyle(
          fontSize: 18,
          height: 1.7,
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontFamily: 'Open sans',
        ),
        overline: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w200,
          color: Colors.grey,
          fontStyle: FontStyle.italic,
          fontFamily: 'Open sans',
        ),
        bodyText1: TextStyle(
          fontSize: 21.0,
          height: 1.7,
          fontFamily: 'Open sans',
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Open sans',
          color: Colors.black,
        ),
        button: TextStyle(
          fontFamily: 'Open sans',
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      accentColor: accentColor,
      primaryColor: primaryColor,
      backgroundColor: backgroundColor,
    );
  }
}
