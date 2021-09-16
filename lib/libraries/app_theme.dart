import 'dart:ui' show Color;

///import 'package:flutter/cupertino.dart';

class AppTheme {
  AppTheme({
    required this.primary,
    required this.secondary,
    required this.third,
    required this.background,
    required this.fonts,
  });

  Color primary;
  Color secondary;
  Color third;
  Color background;
  AppFonts fonts;
}

class AppFonts {
  AppFonts({
    required this.title,
    required this.display,
    required this.text,
    required this.textBold,
    required this.textAccent,
  });
  String title;
  String display;
  String text;
  String textBold;
  String textAccent;
}
