import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tufic_app/const/tufic_theme.dart';

class SeleccionarSabores extends StatelessWidget {
  final double ancho;

  // ignore: use_key_in_widget_constructors
  const SeleccionarSabores({
    required this.ancho,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sabores',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  //color: tuficTheme.primary,
                  color: Colors.black,
                  fontSize: ancho * 0.03,
                  fontFamily: tuficTheme.fonts.title,
                )),
            Text('No se seleccionaron sabores',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  //color: tuficTheme.primary,
                  color: Colors.black,
                  fontSize: ancho * 0.03,
                  fontFamily: tuficTheme.fonts.text,
                )),
          ],
        ),
        Expanded(child: Container()),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(tuficTheme.secondary),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            )),
          ),
          onPressed:
              () {}, //=> Navigator.pushNamed(context, SelecionPage.routeName),
          child: Text('Seleccionar',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                //color: tuficTheme.primary,
                fontSize: ancho * 0.03,
                fontFamily: tuficTheme.fonts.text,
              )),
        ),
      ],
    );
  }
}
