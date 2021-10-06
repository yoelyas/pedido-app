// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/provider/category_provider.dart';
import 'package:tufic_app/provider/productos_providers.dart';
import 'package:tufic_app/provider/search_provider.dart';
import 'package:tufic_app/widgets/barra_de_busqueda.dart';
import 'package:tufic_app/widgets/menu_categorias.dart';
import 'package:tufic_app/widgets/producto_widgets.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class ProductosPage extends StatelessWidget {
  static const String routeName = 'productos';
  const ProductosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainAppBar = MainAppBar(
      context: context,
    );

    return Scaffold(
        appBar: mainAppBar.getWidget(false),
        drawer: SideBarMenu(context: context),
        //backgroundColor: Colors.white,
        body: buildProductList(context) //(context),
        );
  }

//Crea un future para cargar el JSON de productos y crea Widgets con dicha informacion
  Widget buildProductList(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);

    final Future<List<ProductListItem>> _calculation =
        Future<List<ProductListItem>>.delayed(const Duration(milliseconds: 500),
            () => productosProvider.getProductList());

// muestra un CircularProgressIndicator hasta que carga el Json
    return FutureBuilder(
      future: _calculation,
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
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);

    // filtrar segun
    List<ProductListItem> productosFiltered = searchProvider.filter(productos);

    //recorre todos los productos opteniendo las categorias
    List<String> categorias = [];
    for (var item in productosFiltered) {
      if (!categorias.contains(item.category)) {
        categorias.add(item.category);
      }
    }

    //revisar esta parte
    // Comparar listas de categorias antes de setear, solo setear si son distintas
    //seteando su visivilidad en 0
    //en el caso de que categorias este vacio
    if (categorias.isNotEmpty) {
      for (var category in categoryProvider.getCategoryList()) {
        if (!categorias.contains(category)) {
          categoryProvider.setCategoryVisibility(category, 0);
        }
      }
      categoryProvider.setCategoryList(categorias);
    } else {
      categoryProvider.resetVisibility();
      categoryProvider.setCategoryList(categorias);
    }

    //Si no hay una categoria seleccionada setea la primera categoria
    //que alla en  la lista de categorias
    if (categorias.isNotEmpty && categoryProvider.getSelected().isEmpty) {
      categoryProvider.setSelectedCategory(categorias[0]);
    }

    //crea Los productos
    MenuCategoriasWidget menuCategoriasWidget = MenuCategoriasWidget(
      categorias: categorias,
    );

//gestureDetector + FocusScope para cerrar el teclado cuando se hace click fuera de la caja de texto
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(6.0),
          child: MySearchForm(),
          //child: SearchBar.build(context),
        ),
        //crea la pantalla de busqueda si encuentra o no los productos
        productosFiltered.isEmpty
            ? widgetSinResultados(context, searchProvider)
            : Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: menuCategoriasWidget.build(context),
                    ),
                    ProductListPage(
                        productList: productosFiltered, categorias: categorias),
                  ],
                ),
              )
      ]),
    );
  }

  widgetSinResultados(BuildContext context, SearchProvider searchProvider) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              shape: BoxShape.circle,
            ),
            width: 190,
            height: 190,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 12,
                ),
                Icon(
                  Icons.search_off,
                  size: 90,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "No se encontraron coincidencias\n para tu búsqueda.", //cartProvider.getStore(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: tuficTheme.fonts.text,
                    ),
                    textAlign: TextAlign.center),
              ],
            ),
          )
        ],
      ),
    );
  }
}
