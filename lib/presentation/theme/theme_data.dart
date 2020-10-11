import 'package:flutter/material.dart';
import 'package:gutenberg/presentation/theme/colors.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(brightness: Brightness.dark),
  accentColor: accentColor,
  textTheme: TextTheme(
    headline1: TextStyle(
        fontSize: 40, fontWeight: FontWeight.w700, color: accentColor),
    headline2: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
    headline3: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    headline4: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
    headline6: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: mediumGrey),
    caption: TextStyle(fontSize: 11.5),
  ),
  scaffoldBackgroundColor: secondaryColor,
  primaryColor: accentColor,
  fontFamily: "Montserrat",
  typography: Typography.material2018(
    platform: TargetPlatform.android,
  ),
);

/// Main ThemeData of the app [Light]
