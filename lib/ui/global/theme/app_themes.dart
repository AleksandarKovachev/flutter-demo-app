import 'package:flutter/material.dart';

enum AppTheme { DarkTheme, LightTheme }

final appThemeData = {
  AppTheme.DarkTheme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    accentColor: Colors.blue,
  ),
  AppTheme.LightTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.blue,
  )
};
