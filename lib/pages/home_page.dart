import 'package:flutter/material.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/widgets/buttons.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppBar = MainAppBar(
      context: context,
    );
    return Scaffold(
      appBar: mainAppBar.getWidget(false),
      drawer: SideBarMenu(
        context: context,
      ),
      body: HomeBody(context: context),
    );
  }
}

class HomeBody extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeBody({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 200,
        minHeight: 200,
        maxWidth: 500,
      ),
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          //crea el mensaje de vienvenida
          const WelcomeMessage(),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Elegí una sucursal',
                style: TextStyle(
                  color: tuficTheme.secondary,
                  fontSize: 12,
                  fontFamily: tuficTheme.fonts.text,
                )),
          ),
          const SizedBox(height: 12),
          //crea los botones de sucursales
          CreateButtom.build(double.infinity),

          const SizedBox(
            height: 15,
          ),
          // crea el boton para ver el area del deliveri
          //falta setear el onPressed
          TextButton(
            onPressed: () {
              //link de navegacion para ver el area del deliveri
              // String url = VerAreaDelibety();
              // html.window.open(url, 'name');
            },
            child: Text('Ver área de delivery',
                style: TextStyle(
                  color: tuficTheme.third,
                  fontSize: 14,
                  fontFamily: tuficTheme.fonts.text,
                )),
          ),
        ],
      ),
    ));
  }
}

//crea los botones de sucursales segun la cantidad de sucursales de "sucursal"
class CreateButtom {
  static Widget build(double height) {
    List<Widget> sucursalButtom = [];

    Map<String, dynamic> sucursales = APP_CONFIG["homePage"]!["sucursal"];

    sucursales.forEach((key, value) {
      sucursalButtom.add(BottomSucursal(
        text: value,
      ));
      sucursalButtom.add(
        const SizedBox(
          height: 5,
        ),
      );
    });
    // ignore: prefer_const_literals_to_create_immutables
    return Column(children: sucursalButtom);
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/TRAMAS_tufic-04.png'),
          height: 94,
        ),
        Center(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              APP_CONFIG["homePage"]!["mensaje"]["bienvenida"],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: tuficTheme.fonts.display,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
