import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/provider/producto_provider.dart';
import 'package:tufic_app/provider/seleccion_provider.dart';
import 'package:tufic_app/widgets/producto_widgets.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class MenuProductoPages extends StatelessWidget {
  //ruta ulilizada para navegar hasta esta pantalla
  static const String routeName = 'menuProducto';
  const MenuProductoPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final seleccionProvider = Provider.of<SeleccionProvider>(context);
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
            child: ListView(
              padding: const EdgeInsets.all(5),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                //muestra el producto que se muestra debajo del appbar
                _Contenido(),
                //muestra la parte de lececcionar
                seleccionProvider.getSeleccion() as Widget
              ],
            ),
          ),
        ) ////(context),
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
