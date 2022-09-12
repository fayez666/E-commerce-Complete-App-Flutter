import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    iconTheme: const IconThemeData(
      color: kPrimaryColor
    ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      fontFamily: "Muli",
      inputDecorationTheme: inputDecorationTheme(),
      textTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide:const  BorderSide(color: kPrimaryColor),
        gapPadding: 10.0,
      );
  return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 42,
          vertical: 20
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
}

TextTheme textTheme() {
  return const TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor),
    );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      color: Colors.white,
      titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18),
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 0.0,
    );
}
