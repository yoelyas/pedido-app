// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/menu.dart';
import 'package:tufic_app/const/tufic_theme.dart';

//menu del costado
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain, image: AssetImage(image)),
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
          ButtomList.build(),
        ],
      ),
    );
  }
}

class ButtomList {
  static Widget build() {
    List<Widget> menuButtom = [];

    MENU_CONFIG.forEach((key, value) {
      if (value["onlyAuth"] == inicioSecion || value["onlyAuth"] == null) {
        menuButtom.add(_MenuBottom(
          icon: value["icon"],
          title: value["title"],
          routeName: value["routeName"],
        ));
      }
    });

    return Column(children: menuButtom);
  }
}

class _MenuBottom extends StatelessWidget {
  final IconData icon;
  final String title;
  final String routeName;
  // ignore: use_key_in_widget_constructors
  const _MenuBottom(
      {required this.icon, required this.title, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: tuficTheme.fonts.title,
        ),
      ),
      //Por ahora solo te lleva al homepages
      onTap: () => Navigator.pushReplacementNamed(context, routeName),
    );
  }
}
