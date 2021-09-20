import 'package:flutter/material.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/libraries/responsive.dart';

class MainAppBar {
  BuildContext context;
  String store;
  String logo;
  Responsive? responsive;
  MainAppBar({
    required this.context,
    required this.store,
    required this.logo,
  }) {
    responsive = Responsive(context: context);
  }

  double _getHeight() {
    const Map<String, double> heightMap = {
      "xs": 50,
      "sm": 50,
      "md": 60,
      "lg": 70,
      "xl": 80,
    };

    String screenSize = responsive!.getScreenSize();

    double height = heightMap[screenSize]!;

    if (store.isNotEmpty) {
      height += 10;
    }

    return height;
  }

  AppBar getWidget() {
    return AppBar(
      elevation: 1,
      toolbarHeight: _getHeight(),

      //     backwardsCompatibility: false,
      centerTitle: true,
      title: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(
          logo,
          fit: BoxFit.contain,
          height: _getHeight() - 30,
        ),
        Text(store, //cartProvider.getStore(),
            style: _drawBranch(context, store)),
      ]),
      actions: <Widget>[
        _DrawCart(store: store),
      ],
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  TextStyle _drawBranch(BuildContext context, String store) {
    double height = _getHeight();
    if (store.isNotEmpty) {
      return TextStyle(
        color: tuficTheme.primary,
        fontSize: height - 45,
        fontFamily: tuficTheme.fonts.title,
      );
    } else {
      return const TextStyle(
        fontSize: 0,
      );
    }
  }
}

// ignore: must_be_immutable
class _DrawCart extends StatefulWidget {
  _DrawCart({required this.store});
  String store;

  @override
  State<_DrawCart> createState() => _DrawCartState();
}

class _DrawCartState extends State<_DrawCart> {
  @override
  Widget build(
    BuildContext context,
  ) {
    if (widget.store.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  productCont++;
                  setState(() {});
                }),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0))),
                  //padding: EdgeInsets.only(left: 22, top: 3),
                  child: Text(
                    "$productCont",
                    style: TextStyle(
                      color: tuficTheme.primary,
                      fontSize: 10,
                      fontFamily: tuficTheme.fonts.title,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return const Icon(
        Icons.shopping_cart,
        size: 0,
      );
    }
  }
}
