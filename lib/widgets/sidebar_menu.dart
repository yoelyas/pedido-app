// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/pages/home_page.dart';

class SideBarMenu extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  SideBarMenu({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    String image = APP_CONFIG['drawer']!['avatar'];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain, image: NetworkImage(image)),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(4.0, 4.0),
                    blurRadius: 9.0,
                    spreadRadius: 0.1,
                  ),
                ]),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Pedí online',
              style: TextStyle(
                //color: Colors.white,
                fontSize: 35,
                fontFamily: tuficTheme.fonts.title,
              ),
            ),
          ),
          _MenuBottom(
            icon: Icon(Icons.home),
            title: 'Inicio',
            routeName: HomePage.routeName,
          ),
          _MenuBottom(
            icon: Icon(Icons.people),
            title: 'Registrarme/ Iniciar seción',
            routeName: '',
          ),
          _MenuBottom(
            icon: Icon(Icons.arrow_right),
            title: 'Sabores',
            routeName: '',
          ),
          _MenuBottom(
            icon: Icon(Icons.arrow_right),
            title: 'Sucursales',
            routeName: '',
          ),
          _MenuBottom(
            icon: Icon(Icons.arrow_right),
            title: 'Contacto',
            routeName: '',
          ),
          _MenuBottom(
            icon: Icon(Icons.arrow_right),
            title: 'Inicio',
            routeName: '',
          ),
          _MenuBottom(
            icon: Icon(Icons.arrow_right),
            title: 'Acerca de la APP',
            routeName: '',
          ),
        ],
      ),
    );
  }
}

class _MenuBottom extends StatelessWidget {
  final Icon icon;
  final String title;
  final String routeName;
  // ignore: use_key_in_widget_constructors
  const _MenuBottom(
      {required this.icon, required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: tuficTheme.fonts.title,
        ),
      ),
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
    );
  }
}
