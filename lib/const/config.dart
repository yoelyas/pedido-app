// import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Map<String, Map<String, dynamic>> APP_CONFIG = {
  "appBar": {
    "logo": "assets/logo_tufic.png",
  },
  "drawer": {
    "avatar": "assets/img.jpeg",
  },
  "homePage": {
    "deliveryAreaUrl":
        "https://www.google.com/maps/place/Tufic+Helados/@-34.5600179,-58.4588323,17z/data=!3m1!4b1!4m5!3m4!1s0x95bcb5d35bb69da7:0xbb435c78180d4426!8m2!3d-34.5600223!4d-58.4566436",
  },
  "gridBreakpoints": {
    "xs": 320, //*1
    "sm": 425,
    "md": 768, // *1.2
    "lg": 1024,
    "xl": 1200,
    //320
    // <= 425 es smallScreen
    // <= 768 es mediumScreen
    // <= 1200 es largeScreen
    // > 1200 es xLargeScreen
  }
};

int productCont = 0;

// ignore: non_constant_identifier_names
String VerAreaDelibety() {
  return "https://www.google.com/maps/place/Tufic+Helados/@-34.5600179,-58.4588323,17z/data=!3m1!4b1!4m5!3m4!1s0x95bcb5d35bb69da7:0xbb435c78180d4426!8m2!3d-34.5600223!4d-58.4566436";
}
