import 'package:flutter/material.dart';

abstract class UITheme {
  Color get primaryColor;

  ThemeData get theme;
}

enum ThemeType {
  Light,
  Dark,
}

class UIThemeLight extends UITheme {
  Color get primaryColor => Colors.yellow;

  ThemeData get theme => ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}

class UIThemeDark extends UITheme {
  Color get primaryColor => Colors.indigo;

  ThemeData get theme => ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );
}
