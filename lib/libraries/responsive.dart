// ignore: non_constant_identifier_names
import 'package:flutter/cupertino.dart';

/// Siempre ordenado de menor a mayor
const Map<String, double> breakpoints = {
  "xs": 320, //*1
  "sm": 425,
  "md": 768, // *1.2
  "lg": 1024,
  "xl": 1200,
};

class Responsive {
  BuildContext context;
  double? maxWidth;

  Responsive({
    required this.context,
    this.maxWidth,
  }) {
    maxWidth = maxWidth ?? MediaQuery.of(context).size.width;
  }

  double getScreenWidth() {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight() {
    return MediaQuery.of(context).size.height;
  }

  double getMaxWidth() {
    return (getScreenWidth() > maxWidth!) ? maxWidth! : getScreenWidth();
  }

  String getScreenSize() {
    double width = getScreenWidth();
    String size = '';

    breakpoints.forEach((key, value) {
      if (size == '') {
        size = key;
      }
      if (width >= value) {
        size = key;
      }
    });

    return size;
  }

  fit(Map<String, dynamic> returnMap) {
    String screenSize = getScreenSize();

    dynamic returnValue;

    bool finished = false;

    breakpoints.forEach((key, value) {
      // existe el valor de la key en el map?
      if (!finished) {
        if (returnMap.containsKey(key)) {
          returnValue = returnMap[key];
        }
        finished = screenSize == key;
      }
    });

    return returnValue;
  }
}
