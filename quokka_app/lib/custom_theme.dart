import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme { 
    return ThemeData(
      primaryColor: Colors.purple,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat', 
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.purple[300],
      )
    );
  }
}