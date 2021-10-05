import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/models/select_options.dart';
import 'package:tufic_app/providers/cart_provider.dart';
import 'package:tufic_app/services/selected_options_providers.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class SeleccionarSaboresPage extends StatelessWidget {
  static const String routeName = 'seleccionSabores';
  const SeleccionarSaboresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    final mainAppBar = MainAppBar(
        context: context,
        logo: APP_CONFIG['appBar']!['logo'],
        store: cartProvider.getStore());

    return Scaffold(
        appBar: mainAppBar.getWidget(true),
        drawer: SideBarMenu(context: context),
        backgroundColor: Colors.white,
        body: Center(
          child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: 200,
                minHeight: 200,
                maxWidth: 500,
                // maxHeight: 500,
              ),
              child: buildProductList(context)),
        ) ////(context),
        );
  }

  Widget buildProductList(BuildContext context) {
    final optionsProvider = Provider.of<SelectedOptionsProvider>(context);

    final Future<Options> _calculation = Future<Options>.delayed(
        const Duration(milliseconds: 500),
        () => optionsProvider.getProductList());

    return FutureBuilder(
      future: _calculation,
      builder: (context, AsyncSnapshot<Options> snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
