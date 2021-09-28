import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/pages/productos_pages.dart';
import 'package:tufic_app/providers/cart_provider.dart';

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
          final Color color = tuficTheme.secondary;
          return BorderSide(color: color, width: 1);
        }),
      ),
      child: SizedBox(
        // height: 5,
        width: 250,
        child: Center(
          child: Text(text,
              style: TextStyle(
                color: tuficTheme.secondary,
                fontSize: 12,
                fontFamily: tuficTheme.fonts.text,
              )),
        ),
      ),
      onPressed: () {
        cartProvider.initializate(text);
        Navigator.pushReplacementNamed(context, ProductosPage.routeName);
      },
    );
  }
}
