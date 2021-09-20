import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/providers/cart_provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final mainAppBar = MainAppBar(
        context: context,
        logo: APP_CONFIG['appBar']!['logo'],
        store: cartProvider.getStore());
    return Scaffold(
      appBar: mainAppBar.getWidget(),
      drawer: Drawer(),
      body: Center(
        child: TextButton(
            child: const Text("inicializar/borrar bariables "),
            onPressed: () {
              if (cartProvider.getStore().isEmpty) {
                cartProvider.initializate("Belgrano");
              } else {
                cartProvider.clear();
              }
            }),
      ),
    );
  }
}
