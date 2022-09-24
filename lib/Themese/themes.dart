import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        //
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10)),
          primary: Color(0xFFd81b60),
          textStyle: TextStyle(color: Colors.black),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.white54,
      ),
      primaryColor: Color(0xFF9e9e9e),
      secondaryHeaderColor: Colors.black,
      textSelectionColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFd81b60),
      ),
      cardColor: Colors.white70,

      //bottom bar ıcon rengi

      inputDecorationTheme:
          InputDecorationTheme(fillColor: Colors.black12.withAlpha(12)));

  final darkTheme = ThemeData.dark().copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0)),
          primary: Color(0xFFd81b60),
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      primaryColor: Colors.grey[700],
      secondaryHeaderColor: Colors.white,
      textSelectionColor: Colors.black,
      scaffoldBackgroundColor: Colors.grey[800],
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFd81b60),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.grey[700],
      ),
      cardColor: Colors.grey[700],
      inputDecorationTheme:
          InputDecorationTheme(fillColor: Colors.grey.withOpacity(0.1)));
}
