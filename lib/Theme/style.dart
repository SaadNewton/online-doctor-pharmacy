import 'package:flutter/material.dart';

final BorderRadius radius = BorderRadius.circular(6.0);

final ThemeData appTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Color(0xffF4F7F8),
  primaryColor: Color(0xff075CC9),
  primaryColorLight: Color(0xffD0F4EF),
  splashColor: Color(0xffC4EBF2),
  disabledColor: Colors.grey[500],
  highlightColor: Colors.grey[200],
  hintColor: Colors.black,
  dividerColor: Color(0xffF4F7F8),

  ///appBar theme
  appBarTheme: AppBarTheme(
    color: Colors.transparent,
    elevation: 0.0,
    iconTheme: IconThemeData(color: Colors.black),
  ),

  ///text theme
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    bodyText2: TextStyle(fontWeight: FontWeight.w400),
    subtitle1: TextStyle(fontWeight: FontWeight.w500),
    subtitle2: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w400),
    headline1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(fontWeight: FontWeight.bold),
    headline5: TextStyle(),
    headline6: TextStyle(),
  ).apply(bodyColor: Colors.black),
);

final TextStyle bottomBarTextStyle = TextStyle(
  fontSize: 15.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
