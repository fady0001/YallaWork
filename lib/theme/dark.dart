
import 'package:flutter/material.dart';



enum DarkTheme {

  Light( "Dark Mode",Icons.nightlight_round),
  Dark("Light Mode",Icons.wb_sunny);

  const DarkTheme( this.name,this.icon);
final String name;
  final IconData icon;
}



final appThemeData = {
  DarkTheme.Light: ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    fontFamily: 'myFont'
  ),
  DarkTheme.Dark: ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF333333)),
    brightness: Brightness.dark,
    primaryColor: Colors.blue[700],
      fontFamily: 'myFont'
  ),

};



