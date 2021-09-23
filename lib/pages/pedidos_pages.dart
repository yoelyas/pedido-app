import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/providers/cart_provider.dart';
import 'package:tufic_app/services/productos_providers.dart';
import 'package:tufic_app/widgets/producto_widgets.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class PedidosPage extends StatelessWidget {
  static const String routeName = 'pedidos';
  const PedidosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final mainAppBar = MainAppBar(
        context: context,
        logo: APP_CONFIG['appBar']!['logo'],
        store: cartProvider.getStore());

    return Scaffold(
        appBar: mainAppBar.getWidget(),
        drawer: SideBarMenu(context: context),
        //backgroundColor: Colors.white,
        body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _buildProductList(context),
          ],
        ) //
        );
  }

  Widget _buildProductList(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);

    return FutureBuilder(
      future: productosProvider.getProductList(),
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Productos(snapshot.data as List<ProductListItem>);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class Productos extends StatelessWidget {
  final List<ProductListItem> productos;

  // ignore: use_key_in_widget_constructors
  const Productos(
    this.productos,
  );
// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          // width: 50,
          child: Text('Promos',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: tuficTheme.fonts.title,
              )),
        ),
        PromosPages(
          productListItem: productos[0],
        ),
        const Divider(
          height: 20,
          indent: 20,
          endIndent: 20,
        ),
        SizedBox(
          // width: 20,
          child: Text('Helados',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: tuficTheme.fonts.title,
              )),
        ),
        ProductListPage(
          productList: productos,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
