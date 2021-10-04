import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tufic_app/const/tufic_theme.dart';

class SeleccionarSabores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('sabores',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    //color: tuficTheme.primary,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: tuficTheme.fonts.textBold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No se seleccionaron sabores',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    //color: tuficTheme.primary,
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: tuficTheme.fonts.text,
                  )),
            ),
          ],
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: tuficTheme.secondary),
            height: 30,
            width: 90,
            child: TextButton(
              onPressed:
                  () {}, //=> Navigator.pushNamed(context, SelecionPage.routeName),
              child: Text('Seleccionar',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    //color: tuficTheme.primary,
                    fontSize: 12,
                    fontFamily: tuficTheme.fonts.text,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
