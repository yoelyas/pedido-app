import 'package:flutter/material.dart';
import 'package:pedidos_app/pages/home_page.dart';

// ignore: constant_identifier_names
const Map<String, Map<String, dynamic>> MENU_CONFIG = {
  "inicio": {
    "title": "Inicio",
    "icon": Icons.home_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": null,
  },
  "registro": {
    "title": "Registro / Iniciar sección",
    "icon": Icons.person_outline,
    "routeName": HomePage.routeName,
    "onlyAuth": false,
  },
  "cuenta": {
    "title": "Mi cuenta",
    "icon": Icons.person_outline,
    "routeName": HomePage.routeName,
    "onlyAuth": true,
  },
  "Mis pedidos": {
    "title": "Mis pedidos",
    "icon": Icons.play_arrow_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": true,
  },
  "direcciones": {
    "title": "Mis direcciones",
    "icon": Icons.play_arrow_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": true,
  },
  "sabores": {
    "title": "Sabores",
    "icon": Icons.play_arrow_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": true,
  },
  "sucursales": {
    "title": "Sucursal",
    "icon": Icons.play_arrow_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": null,
  },
  "contacto": {
    "title": "Contacto",
    "icon": Icons.play_arrow_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": null,
  },
  "info": {
    "title": "Acerca de la APP",
    "icon": Icons.play_arrow_outlined,
    "routeName": HomePage.routeName,
    "onlyAuth": null,
  },
};
