import 'package:fatima_admin/Helpers/CustomColors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
        primarySwatch: CustomColors.getMaterialColor(CustomColors.primary),
        primaryColor: CustomColors.purple,
        scaffoldBackgroundColor: Colors.white,
        secondaryHeaderColor: CustomColors.primary,
        fontFamily: 'Montserrat', //3
        buttonTheme: ButtonThemeData(
          // 4
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primarySwatch: CustomColors.getMaterialColor(CustomColors.darkGrey),
        primaryColor: CustomColors.darkGrey,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: CustomColors.lightPurple,
        ));
  }
}
