import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pedidos_app/pages/home_page.dart';
import 'package:pedidos_app/pages/menu_producto_page.dart';
import 'package:pedidos_app/pages/productos_page.dart';
import 'package:pedidos_app/pages/seleccionar_sabores_page.dart';
import 'package:pedidos_app/provider/cart_provider.dart';
import 'package:pedidos_app/provider/category_provider.dart';
import 'package:pedidos_app/provider/producto_provider.dart';
import 'package:pedidos_app/provider/productos_providers.dart';
import 'package:pedidos_app/provider/seleccion_provider.dart';
import 'package:pedidos_app/provider/selected_options_providers.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductosProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SelectedOptionsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SeleccionProvider(),
        ),
      ],
      child: const pedidosApp(),
    );
  }
}

class pedidosApp extends StatelessWidget {
  const pedidosApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pedidos App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'productos': (_) => ProductosPage(),
        'menuProducto': (_) => const MenuProductoPages(),
        'seleccionSabores': (_) => const SeleccionarSaboresPage(),
      },
    );
  }
}
