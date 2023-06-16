import 'package:flutter/material.dart';

import 'color.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // //Main app colors
    primaryColor: ColorApp.black, //Primary color for app
    fontFamily: "Gilroy",
    scaffoldBackgroundColor:
        ColorApp.gryBackground(1.0), //Background color for scaffold

    // TEXT FIELD
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      filled: true,
      fillColor: ColorApp.gryBackgroundTextField(0.4),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      hintStyle: TextStyle(
          color: ColorApp.gryHintTextField(0.4),
          fontSize: 16,
          fontWeight: FontWeight.w300),
      labelStyle:
          TextStyle(color: ColorApp.gryHintTextField(0.4), fontSize: 16),
      errorStyle: const TextStyle(
          color: Colors.red, fontWeight: FontWeight.w300, fontSize: 10),
    ),

    //Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(), //Button shape
      buttonColor: ColorApp.blueButton(1.0), //Button color
      //Button splash color
    ),
  );
}
