// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufic_app/components/main_app_bar.dart';
import 'package:tufic_app/const/filter.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/provider/category_provider.dart';
import 'package:tufic_app/provider/productos_providers.dart';
import 'package:tufic_app/widgets/menu_categorias.dart';
import 'package:tufic_app/widgets/producto_widgets.dart';
import 'package:tufic_app/widgets/sidebar_menu.dart';

class ProductosPage extends StatelessWidget {
  static const String routeName = 'productos';
  ProductosPage({Key? key}) : super(key: key) {
    print('Dibujando ProductosPage');
  }

  @override
  Widget build(BuildContext context) {
    print('Dibujando ProductosPage.build');
    final mainAppBar = MainAppBar(
      context: context,
    );

    return Scaffold(
        appBar: mainAppBar.getWidget(false),
        drawer: SideBarMenu(context: context),
        //backgroundColor: Colors.white,
        body: _buildBody(context) //(context),
        );
  }

  Widget _buildBody(BuildContext context) {
    final productosProvider = Provider.of<ProductosProvider>(context);

    final Future<List<ProductListItem>> _future =
        Future<List<ProductListItem>>.delayed(const Duration(milliseconds: 500),
            () => productosProvider.getProductList());

    // muestra un CircularProgressIndicator hasta que carga el Json
    return FutureBuilder(
      future: _future,
      builder: (context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _getBodyWidgets(
              context, snapshot.data as List<ProductListItem>);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _getBodyWidgets(
      BuildContext context, List<ProductListItem> productList) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ProductListWidget(
          productList: productList,
          context: context,
        ));
  }
}

class ProductListWidget extends StatefulWidget {
  final List<ProductListItem> productList;
  final BuildContext context;
  late CategoryProvider categoryProvider;

  ProductListWidget(
      {Key? key, required this.productList, required this.context})
      : super(key: key) {
    categoryProvider = Provider.of<CategoryProvider>(context);
  }

  @override
  _ProductListStateWidget createState() => _ProductListStateWidget();
}

class _ProductListStateWidget extends State<ProductListWidget> {
  final _filterController = TextEditingController();
  final Filter _filter = Filter();
  List<ProductListItem> _filteredProductList = [];

  @override
  Widget build(BuildContext context) {
    _filteredProductList = _filter.filter(widget.productList);
    return Column(children: [
      _getFilterWidget(context),
      _getResultsWidget(context),
    ]);

    // Fill this out in the next step.
  }

  Widget _getResultsWidget(context) {
    return _filteredProductList.isEmpty
        ? _getEmptyResultsWidget(context)
        : _getFilteredProductListWidget(context);
  }

  Widget _getEmptyResultsWidget(context) {
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

  Widget _getFilteredProductListWidget(context) {
    print('Redibujando filtrado');
    CategoryProvider categoryProvider = widget.categoryProvider!;
    List<String> categorias = [];
    for (var item in _filteredProductList) {
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
      print("Selecciono el primero");
      categoryProvider.setSelectedCategory(categorias[0]);
    }

    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MenuCategoriasWidget(categorias: categorias),
          ),
          ProductListViewWidget(
              categorias: categorias, productList: _filteredProductList),
        ],
      ),
    );
  }

  SizedBox _getFilterWidget(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 250,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.grey.shade300,
        ),
        child: CupertinoTextField(
            controller: _filterController,
            onChanged: (text) {
              setState(() {
                _filter.setSearchText(text);
              });
            },
            placeholder: 'Buscar...',
            autocorrect: false,
            prefix: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.search,
                color: Colors.black45,
              ),
            ),
            suffix: _filter.getText().isNotEmpty
                ? IconButton(
                    padding: const EdgeInsets.all(5),
                    onPressed: () {
                      _filterController.clear();
                      setState(() {
                        _filter.reset();
                      });
                      //cierra el teclado virtual
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    iconSize: 20,
                    color: Colors.black45,
                    icon: const Icon(
                      Icons.cancel_outlined,
                    ))
                : Container(),
            style: TextStyle(
              color: Colors.black87, //tuficTheme.primary,
              fontSize: 15,
              fontFamily: tuficTheme.fonts.text,
            ),
            decoration: const BoxDecoration(color: Colors.transparent)),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _filterController.dispose();
    super.dispose();
  }
}
