import 'package:flutter/material.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/libraries/responsive.dart';

class MainAppBar {
  BuildContext context;
  String store;
  String logo;
  Responsive? responsive;

  Map<String, double> heightMap = {
    "xs": 40,
    "sm": 45,
    "md": 50,
    "lg": 55,
    "xl": 60,
  };
  double subTitle = 15;
  double title = 20;

  MainAppBar({
    required this.context,
    required this.store,
    required this.logo,
  }) {
    responsive = Responsive(context: context);
  }

  AppBar getWidget() {
    List<Widget> column = [
      Image.asset(
        logo,
        fit: BoxFit.contain,
        //el -10 es el margen que quiero que tenga mi logo
        height: _getTamanoPantalla() - title,
      )
    ];

// dibuja la sucursal en el appbar si este se encuentra seteado
// en caso contrario setea su font el 0 para que el appbar ocupe menos espacio
    if (store.isNotEmpty) {
      column.add(Text(store, //cartProvider.getStore(),
          style: TextStyle(
            color: tuficTheme.primary,
            fontSize: subTitle,
            fontFamily: tuficTheme.fonts.title,
          )));
    }
    return AppBar(
      elevation: 1,
      toolbarHeight: _getHeightAppBar(),
      centerTitle: true,
      title:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: column),
      actions: <Widget>[
        _DrawCart(store: store),
      ],
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  // me devuelve el alto del appbar sin modificar segun el tamaño de la pantalla
  double _getTamanoPantalla() {
    String screenSize = responsive!.getScreenSize();

    double height = heightMap[screenSize]!;
    return height;
  }

// debuelve el alto del appbar sumandle el tamaño del subtitulo si este esta seteado
  double _getHeightAppBar() {
    double heigth = _getTamanoPantalla();

    return store.isEmpty ? heigth : heigth + subTitle;
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
  double iconSize = 30;
  @override
  Widget build(
    BuildContext context,
  ) {
    if (widget.store.isNotEmpty) {
      return Container(
        //padding: const EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: iconSize,
                ),
                onPressed: () {
                  productCont++;
                  setState(() {});
                }),
            contCompras(),
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

  Row contCompras() {
    double fontSize = iconSize - 18;
    double height = iconSize - 15;
    double width = iconSize - 15;
    if (productCont != 0) {
      return Row(
        children: [
          SizedBox(
            width: iconSize - 10,
          ),
          Container(
            alignment: Alignment.center,
            height: height,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black),
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(50.0))),
            //padding: EdgeInsets.only(left: 22, top: 3),
            child: Text(
              "$productCont",
              style: TextStyle(
                color: tuficTheme.primary,
                fontSize: fontSize,
                fontFamily: tuficTheme.fonts.title,
              ),
            ),
          ),
        ],
      );
    } else {
      return Row();
    }
  }
}
