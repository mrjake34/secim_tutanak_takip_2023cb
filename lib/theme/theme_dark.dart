import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
    fontFamily: 'Rubik',
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      //Buttons Text and userInteractive
      primary: Color.fromARGB(255, 166, 166, 166),
      onPrimary: Color.fromARGB(255, 166, 166, 166),
      secondary: Color.fromARGB(255, 166, 166, 166),
      onSecondary: Color.fromARGB(255, 166, 166, 166),
      error: Colors.red,
      onError: Colors.redAccent,
      //Scaffold Background
      background: Color.fromARGB(255, 26, 26, 46),
      onBackground: Color.fromARGB(255, 166, 166, 166),
      //Scaffold Color and Cards
      surface: Color.fromARGB(255, 22, 33, 62),
      onSurface: Colors.white70,
      //Card Text
      tertiary: Color.fromARGB(255, 210, 210, 210),
      onTertiary: Color.fromARGB(255, 166, 166, 166),
    ),

    //Text
    cardTheme: CardTheme(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
            foregroundColor: const Color.fromARGB(255, 210, 210, 210),
            backgroundColor: Colors.lightBlue,
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
      foregroundColor: const Color.fromARGB(255, 210, 210, 210),
    )),
    appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.aBeeZee(
            textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Color.fromARGB(255, 210, 210, 210),
        )),
        elevation: 2.0,
        shadowColor: Colors.black),
    dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)))),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromARGB(255, 22, 33, 62),
    ));
