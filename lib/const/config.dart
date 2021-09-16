import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const Map<String, Map<String, dynamic>> APP_CONFIG = {
  "appBar": {
    "logo": "assets/logo_tufic.png",
  },
  "homePage": {
    "deliveryAreaUrl":
        "https://www.google.com/maps/place/Tufic+Helados/@-34.5600179,-58.4588323,17z/data=!3m1!4b1!4m5!3m4!1s0x95bcb5d35bb69da7:0xbb435c78180d4426!8m2!3d-34.5600223!4d-58.4566436",
  },
};

// ignore: non_constant_identifier_names
double Maxwidth(BuildContext context) {
  if (MediaQuery.of(context).size.width < 500) {
    return MediaQuery.of(context).size.width;
  } else {
    return 500;
  }
}

// ignore: non_constant_identifier_names
double Maxheight(BuildContext context) {
  if (MediaQuery.of(context).size.height < 500) {
    return MediaQuery.of(context).size.height;
  } else {
    return 500;
  }
}

// ignore: non_constant_identifier_names
String VerAreaDelibety() {
  return "https://www.google.com/maps/place/Tufic+Helados/@-34.5600179,-58.4588323,17z/data=!3m1!4b1!4m5!3m4!1s0x95bcb5d35bb69da7:0xbb435c78180d4426!8m2!3d-34.5600223!4d-58.4566436";
}
