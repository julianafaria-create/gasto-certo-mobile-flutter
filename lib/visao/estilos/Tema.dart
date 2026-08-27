import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData temaEscuro() {
  final baseTheme = ThemeData(
    fontFamily: "Open Sans",
  );
  return baseTheme.copyWith(
    brightness: Brightness.dark,
    primaryColor: Color(0xFF143642),
    primaryColorLight: Color(0xFF26667d),
    primaryColorDark: Color(0xFF08161b),
    highlightColor: Colors.white,
    //primaryColorBrightness: Brightness.dark,
    //accentColor: Colors.white,
  );
}
