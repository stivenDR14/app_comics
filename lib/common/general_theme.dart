import 'package:flutter/material.dart';

import 'custom_colors.dart';

ThemeData generalTheme() {
  return ThemeData(
      disabledColor: CustomColors.dustyBlue.withOpacity(0.5),
      splashColor: CustomColors.orangeLight,
      primaryColor: CustomColors.darkSalmon,
      focusColor:CustomColors.darkSalmon,
      primarySwatch: Colors.grey,
      dividerColor: CustomColors.darkSalmon,
      scaffoldBackgroundColor: CustomColors.dustyBlue,
      primaryColorDark: CustomColors.darkSalmon,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: CustomColors.orangeLight,
      ),
      textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 42.0, fontFamily: 'Antonio', fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 26.0, fontFamily: 'Antonio', fontWeight: FontWeight.w500),
      bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Antonio', fontWeight: FontWeight.w300),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Antonio', fontWeight: FontWeight.w500),
      )
  );
}