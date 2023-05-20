import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Rubik',
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 0, 0, 0),
    //Buttons Text and userInteractive
    onPrimary: Color.fromARGB(255, 87, 92, 107),
    secondary: Colors.black,
    onSecondary: Color.fromARGB(255, 87, 92, 107),
    error: Colors.red,
    onError: Colors.redAccent,
    background: Color(0xFFFFFFFF),
    //Scaffold Background
    onBackground: Colors.white,
    //Scaffold Color and Cards
    surface: Colors.white,
    onSurface: Color.fromARGB(255, 0, 0, 0),
    //
    tertiary: Color.fromARGB(255, 0, 0, 0),
    onTertiary: Color.fromARGB(255, 0, 0, 0),
  ),
  cardTheme: CardTheme(
      color: const Color.fromARGB(255, 231, 231, 231),
      surfaceTintColor: const Color.fromARGB(255, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: const Color.fromARGB(255, 82, 196, 26),
          foregroundColor: Colors.white,
          side: BorderSide.none,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.0)))),
  textButtonTheme: TextButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: const Color.fromARGB(255, 87, 92, 107),
  )),
  appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
      elevation: 2.0,
      shadowColor: Colors.black),
);
