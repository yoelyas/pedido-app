import 'package:flutter/material.dart';
import 'package:pedidos_app/const/theme.dart';
import 'package:provider/provider.dart';
import 'package:pedidos_app/components/main_app_bar.dart';
import 'package:pedidos_app/models/product_list_item.dart';
import 'package:pedidos_app/models/select_options.dart';
import 'package:pedidos_app/pages/seleccionar_sabores_page.dart';
import 'package:pedidos_app/provider/producto_provider.dart';
import 'package:pedidos_app/provider/selected_options_providers.dart';
import 'package:pedidos_app/widgets/producto_widgets.dart';
import 'package:pedidos_app/widgets/sidebar_menu.dart';

class MenuProductoPages extends StatelessWidget {
  //ruta ulilizada para navegar hasta esta pantalla
  static const String routeName = 'menuProducto';
  const MenuProductoPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //configura el appbar
    final mainAppBar = MainAppBar(
      context: context,
    );

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
            child: Column(
              //padding: const EdgeInsets.all(5),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                //muestra el producto que se muestra debajo del appbar
                _Contenido(),
                //muestra la parte de lececcionar
                buildSeleccionarSaboresList(context)
              ],
            ),
          ),
        ) ////(context),
        );
  }

  Widget buildSeleccionarSaboresList(BuildContext context) {
    final optionsProvider = Provider.of<SelectedOptionsProvider>(context);
    final Future<List<Product>> _calculation = Future<List<Product>>.delayed(
        const Duration(milliseconds: 500),
        () => optionsProvider.getProductList());

    return FutureBuilder(
      future: _calculation,
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return SeleccionarSabores(snapshot.data as List<Product>);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

//
class _Contenido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    double alto = 300;
    return Column(
      children: [
        SizedBox(
          height: alto * 0.05,
        ),
        ProductoMenu(
          productListItem: productoProvider.getProducto() as ProductListItem,
        ),
        SizedBox(
          height: alto * 0.05,
        ),
        const Divider(),
        // seleccionarSabores(ancho: ancho),
      ],
    );
  }
}

class SeleccionarSabores extends StatelessWidget {
  final List<Product> product;
  // ignore: use_key_in_widget_constructors
  const SeleccionarSabores(this.product);

  @override
  Widget build(BuildContext context) {
    final List<Widget> wigetproduts = [];
    for (var item in product) {
      wigetproduts.add(Producto(
        product: item,
      ));
    }
    return Expanded(
      child: ListView(
        children: wigetproduts,
      ),
    );
  }
}

class Producto extends StatelessWidget {
  final Product product;
  // ignore: use_key_in_widget_constructors
  const Producto({required this.product});

  @override
  Widget build(BuildContext context) {
    final selectedOptionsProvider =
        Provider.of<SelectedOptionsProvider>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    //color: pedidosTheme.primary,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: pedidosTheme.fonts.textBold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('No se seleccionaron ${product.title}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    //color: pedidosTheme.primary,
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: pedidosTheme.fonts.text,
                  )),
            ),
          ],
        ),
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: pedidosTheme.secondary),
            height: 30,
            width: 90,
            child: TextButton(
              onPressed: () {
                selectedOptionsProvider.setJson(product.id);
                selectedOptionsProvider.initializate(product.options[0]);
                Navigator.pushNamed(context, SeleccionarSaboresPage.routeName);
              },
              child: Text('Seleccionar',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    //color: pedidosTheme.primary,
                    fontSize: 12,
                    fontFamily: pedidosTheme.fonts.text,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
