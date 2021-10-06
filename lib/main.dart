import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/pages/home_page.dart';
import 'package:tufic_app/pages/menu_producto_page.dart';
import 'package:tufic_app/pages/productos_page.dart';
import 'package:tufic_app/pages/seleccionar_sabores_page.dart';
import 'package:tufic_app/services/cart_provider.dart';
import 'package:tufic_app/services/category_provider.dart';
import 'package:tufic_app/services/producto_provider.dart';
import 'package:tufic_app/services/productos_providers.dart';
import 'package:tufic_app/services/search_provider.dart';
import 'package:tufic_app/services/seleccion_provider.dart';
import 'package:tufic_app/services/selected_options_providers.dart';

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
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductoProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SeleccionProvider(),
        ),
      ],
      child: const TuficApp(),
    );
  }
}

class TuficApp extends StatelessWidget {
  const TuficApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tufic App',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomePage(),
        'productos': (_) => const ProductosPage(),
        'menuProducto': (_) => const MenuProductoPages(),
        'seleccionSabores': (_) => const SeleccionarSaboresPage(),
      },
    );
  }
}
