import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedidos_app/const/theme.dart';
import 'package:pedidos_app/pages/seleccionar_sabores_page.dart';

class OldSeleccionarSabores extends StatelessWidget {
  const OldSeleccionarSabores({Key? key}) : super(key: key);

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
                    //color: pedidosTheme.primary,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: pedidosTheme.fonts.textBold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No se seleccionaron sabores',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    //color: pedidosTheme.primary,
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: pedidosTheme.fonts.text,
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
                color: pedidosTheme.secondary),
            height: 30,
            width: 90,
            child: TextButton(
              onPressed: () => Navigator.pushNamed(
                  context, SeleccionarSaboresPage.routeName),
              child: Text('Seleccionar',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    //color: pedidosTheme.primary,
                    fontSize: 12,
                    fontFamily: pedidosTheme.fonts.text,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
//hola