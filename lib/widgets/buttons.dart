import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedidos_app/const/theme.dart';
import 'package:provider/provider.dart';
import 'package:pedidos_app/pages/productos_page.dart';
import 'package:pedidos_app/provider/cart_provider.dart';

//crea el boton de sucursal
class BottomSucursal extends StatelessWidget {
  final String text;
  // ignore: use_key_in_widget_constructors
  const BottomSucursal({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
            const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        )),
        side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
          final Color color = pedidosTheme.secondary;
          return BorderSide(color: color, width: 1);
        }),
      ),
      child: SizedBox(
        // height: 5,
        width: 250,
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: pedidosTheme.secondary,
                fontSize: 12,
                fontFamily: pedidosTheme.fonts.text,
              )),
        ),
      ),
      onPressed: () {
        //inicializa el local y se mueve a otra pantalla
        cartProvider.initializate(text);
        Navigator.pushReplacementNamed(context, ProductosPage.routeName);
      },
    );
  }
}
