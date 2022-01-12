import 'package:flutter/material.dart';
import 'package:pedidos_app/const/config.dart';
import 'package:pedidos_app/const/theme.dart';
import 'package:pedidos_app/libraries/responsive.dart';
import 'package:pedidos_app/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class MainAppBar {
  BuildContext context;
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
  }) {
    responsive = Responsive(context: context);
  }

  AppBar getWidget(bool backButtom) {
    final cartProvider = Provider.of<CartProvider>(context);
    List<Widget> column = [
      Image.asset(
        APP_CONFIG['appBar']!['logo'],
        fit: BoxFit.contain,
        //el -10 es el margen que quiero que tenga mi logo
        height: responsive!.fit(heightMap) - title,
      )
    ];

// dibuja la sucursal en el appbar si este se encuentra seteado
// en caso contrario setea su font el 0 para que el appbar ocupe menos espacio
    if (cartProvider.getStore().isNotEmpty) {
      //agrega una separacion entre el titutlo y la sucursal
      column.add(const SizedBox(
        height: 5,
      ));
      column.add(
          Text(cartProvider.getStore().toUpperCase(), //cartProvider.getStore(),
              style: TextStyle(
                color: pedidosTheme.primary,
                fontSize: ((responsive!.fit(heightMap) * 0.5) - subTitle + 10),
                fontFamily: pedidosTheme.fonts.text,
              )));
    }
    return AppBar(
      elevation: 0,
      leading: backButtom
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back_ios_new_outlined))
          : null,
      toolbarHeight: 63, //_getHeightAppBar(),
      centerTitle: true,
      title:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: column),
      actions: <Widget>[
        _DrawCart(store: cartProvider.getStore()),
      ],
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.black),
    );
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
      return Stack(
        //alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            child: IconButton(
                alignment: Alignment.center,
                icon: const Icon(
                  Icons.shopping_cart,
                  //iconSize,
                ),
                iconSize: iconSize,
                onPressed: () {
                  productCont++;
                  setState(() {});
                }),
          ),
          Container(
            width: iconSize + 10 + 8,
            // + margin right + padding izq del icon button
            alignment: Alignment.centerRight,
            child: contCompras(),
          )
        ],
      );
    } else {
      return const Icon(
        Icons.shopping_cart,
        size: 0,
      );
    }
  }

  Container contCompras() {
    String counter = productCont >= 15 ? "+99" : "$productCont";
    double fontSize = iconSize - 18;
    double height = iconSize - 10;
    double width = 15 + (fontSize * 0.5) * counter.length;
    if (productCont != 0) {
      return Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white),
            color: Colors.red,
            borderRadius: const BorderRadius.all(Radius.circular(50.0))),
        //padding: EdgeInsets.only(left: 22, top: 3),
        child: Text(
          counter,
          style: TextStyle(
            color: Colors.white, //pedidosTheme.primary,
            fontSize: fontSize,
            fontFamily: pedidosTheme.fonts.textBold,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
