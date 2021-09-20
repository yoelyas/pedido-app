// ignore: non_constant_identifier_names
import 'package:flutter/cupertino.dart';

const Map<String, dynamic> breakpoints = {
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
    if (width > breakpoints["lg"]) {
      return "xl";
    } else if (width > breakpoints["md"]) {
      return "lg";
    } else if (width >= breakpoints["sm"]) {
      return "md";
    } else if (width >= breakpoints["xs"]) {
      return "sm";
    }
    return "xs";
  }

  bool isSmallScreen() {
    return getScreenSize() == "sm";
  }

  /*
  static double oldGetMaxWidth(BuildContext context) {
    double width = 
    if (width > breakpoints["lg"]) {
      return breakpoints["xl"];
    } else if (width > breakpoints["md"]) {
      return breakpoints["lg"];
    } else if (width >= breakpoints["sm"]) {
      return breakpoints["md"];
    } else if (width >= breakpoints["xs"]) {
      return breakpoints["sm"];
    }
    return breakpoints["xs"];
  }

  double getMaxHeight(BuildContext context, int? maxHeight) {
    if (MediaQuery.of(context).size.height < 500) {
      return MediaQuery.of(context).size.height;
    } else {
      return 500;
    }
  }
  */
}
