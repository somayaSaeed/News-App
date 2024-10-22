import 'package:flutter/material.dart';
import 'color_resource .dart';

class MyThemeData {
  static final ThemeData lightMode = ThemeData(
    primaryColor: ColorResources.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorResources.primaryColor,
      centerTitle: true,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorResources.white
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: ColorResources.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        fontFamily: "ElMessiri",
      ),
      bodyLarge: TextStyle(
        color: ColorResources.grey,
        fontWeight: FontWeight.bold,
        fontFamily: "ElMessiri",
        fontSize: 30,
      ),
      bodyMedium: TextStyle(
        color: ColorResources.lightGrey,
        fontWeight: FontWeight.w400,
        fontFamily: "ElMessiri",
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: ColorResources.grey,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        fontFamily: "Poppins",

      ),

    ),
  );
}
