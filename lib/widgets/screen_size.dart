import 'package:flutter/cupertino.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/libraries/responsive.dart';

getScreenHeight(BuildContext context) {
  Responsive? responsive = Responsive(context: context);
  return responsive.fit(APP_CONFIG["gridBreakpoints"]!);
}

getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width < 500.0
      ? MediaQuery.of(context).size.width
      : 500.0;
}
