import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/pages/home_page.dart';
import 'package:tufic_app/providers/cart_provider.dart';

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
        'home': (_) => HomePage(),
      },
    );
  }
}
