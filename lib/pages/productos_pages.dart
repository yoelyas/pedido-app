import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/providers/cart_provider.dart';
import 'package:tufic_app/services/category_provider.dart';
import 'package:tufic_app/services/productos_providers.dart';
import 'package:tufic_app/widgets/barra_de_busqueda.dart';
import 'package:tufic_app/widgets/menu_categorias.dart';
import 'package:tufic_app/widgets/producto_widgets.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class ProductosPage extends StatelessWidget {
  static const String routeName = 'productos';
  const ProductosPage({Key? key}) : super(key: key);

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
      body: _buildProductList(context),
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
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    List<String> categorias = [];
    for (var item in productos) {
      if (!categorias.contains(item.category)) {
        categorias.add(item.category);
      }
    }
    categoryProvider.setCategoryList(categorias);
    if (categoryProvider.getSelected().isEmpty) {
      categoryProvider.setSelectedCategory(categorias[0]);
    }

    MenuCategoriasWidget menuCategoriasWidget = MenuCategoriasWidget(
      categorias: categorias,
    );

    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: SearchBar.build(context),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: menuCategoriasWidget.build(context),
      ),
      Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          //scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ProductListPage(productList: productos, categorias: categorias),
          ],
        ),
      ),
    ]);
  }
}

Widget barraDeElecciones(BuildContext context) {
  return Container();
}
