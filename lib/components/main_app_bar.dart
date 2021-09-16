import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';

import '../providers/cart_provider.dart';

class MainAppBar {
  static AppBar create({
    required BuildContext context,
    required String store,
    required String logo,
  }) {
    double height = Maxheight(context);
    return AppBar(
      elevation: 1,
      toolbarHeight: height * 0.15,
      backwardsCompatibility: false,
      centerTitle: true,
      title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Align(
          heightFactor: 0.2,
          child: Image.asset(
            logo,
            fit: BoxFit.contain,
            height: height * 0.2,
          ),
        ),
        Text(store, //cartProvider.getStore(),
            style: drawBranch(context, store)),
      ]),
      actions: <Widget>[
        _DrawCart(store: store),
      ],
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}

TextStyle drawBranch(BuildContext context, String store) {
  double width = Maxwidth(context);
  if (store.isNotEmpty) {
    return TextStyle(
      color: tuficTheme.primary,
      fontSize: width * 0.05,
      fontFamily: tuficTheme.fonts.title,
    );
  } else {
    return const TextStyle(
      fontSize: 0,
    );
  }
}

// ignore: must_be_immutable
class _DrawCart extends StatelessWidget {
  _DrawCart({required this.store});
  String store;

  @override
  Widget build(
    BuildContext context,
  ) {
    if (store.isNotEmpty) {
      return IconButton(
          icon: const Icon(Icons.shopping_cart), onPressed: () {});
    } else {
      return const Icon(
        Icons.shopping_cart,
        size: 0,
      );
    }
  }
}
