import 'dart:ui' show Color;
import 'package:flutter/cupertino.dart';
import 'package:tufic_app/libraries/app_theme.dart';

final tuficTheme = AppTheme(
    primary: const Color.fromRGBO(237, 31, 68, 1),
    secondary: const Color.fromRGBO(151, 23, 105, 1),
    third: const Color.fromRGBO(86, 103, 176, 1),
    background: const Color.fromRGBO(237, 31, 68, 1),
    fonts: AppFonts(
      title: 'gotham-regular',
      display: 'gotham-bold',
      text: 'lato-regular',
      textBold: 'lato-bold',
    ));
