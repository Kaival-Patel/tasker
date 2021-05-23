import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tasker/theme/themeColors.dart';

class AppThemes {
  final lightTheme = ThemeData(
      primaryColor: ThemeColors.greenColor,
      scaffoldBackgroundColor: ThemeColors.lightScaffoldColor,
      backgroundColor: ThemeColors.lightScaffoldColor,
      canvasColor: ThemeColors.lightScaffoldColor,
      buttonColor: ThemeColors.greenColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
          bodyText2: TextStyle(color: ThemeColors.darkScaffoldColor),
          headline3: TextStyle(color: ThemeColors.darkScaffoldColor),
          headline4: TextStyle(color: ThemeColors.darkScaffoldColor),
          headline5: TextStyle(color: ThemeColors.darkScaffoldColor),
          headline6: TextStyle(color: ThemeColors.darkScaffoldColor),
          subtitle1: TextStyle(color: ThemeColors.darkScaffoldColor),
          ));
  final darkTheme = ThemeData(
      primaryColor: ThemeColors.greenColor,
      scaffoldBackgroundColor: ThemeColors.darkScaffoldColor,
      backgroundColor: ThemeColors.darkScaffoldColor,
      canvasColor: ThemeColors.darkScaffoldColor,
      buttonColor: ThemeColors.greenColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
          bodyText2: TextStyle(color: ThemeColors.lightScaffoldColor),
          headline3: TextStyle(color: ThemeColors.lightScaffoldColor),
          headline6: TextStyle(color: ThemeColors.lightScaffoldColor),
          headline4: TextStyle(color: ThemeColors.lightScaffoldColor),
          headline5: TextStyle(color: ThemeColors.lightScaffoldColor),
          subtitle1: TextStyle(color: ThemeColors.lightScaffoldColor),
          ));
}
