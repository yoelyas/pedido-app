import 'package:flutter/material.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';

class BarraProductos extends StatelessWidget {
  const BarraProductos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Text("text",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: tuficTheme.fonts.title,
              )),
          const SizedBox(
            width: 50,
          ),
          Text('helado',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: tuficTheme.fonts.title,
              )),
        ],
      ),
    );
  }
}
