import 'package:flutter/material.dart';
import 'package:pedidos_app/const/theme.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:pedidos_app/models/product_list_item.dart';
import 'package:pedidos_app/pages/menu_producto_page.dart';
import 'package:pedidos_app/provider/category_provider.dart';
import 'package:pedidos_app/provider/producto_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProductListViewWidget extends StatelessWidget {
  final List<ProductListItem> productList;
  final List<String> categorias;
  // ignore: use_key_in_widget_constructors
  const ProductListViewWidget({
    required this.productList,
    required this.categorias,
  });

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    final List<Widget> children = [];
    for (var i = 0; i < categorias.length; i++) {
      final List<Widget> categories = [];
      categories.add(
        SizedBox(
          width: 280,
          child: Text(categorias[i],
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: pedidosTheme.fonts.textBold,
              )),
        ),
      );
      for (var j = 0; j < productList.length; j++) {
        if (categorias[i] == productList[j].category) {
          categories.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductoPages(productListItem: productList[j]),
            ),
          );
        }
      }
      children.add(AutoScrollTag(
          key: ValueKey(categorias[i]),
          controller: categoryProvider.getProductsScrollController(),
          index: i,
          child: VisibilityDetector(
              key: Key(categorias[i]),
              onVisibilityChanged: (visibilityInfo) {
                categoryProvider.setCategoryVisibility(
                    categorias[i], visibilityInfo.visibleFraction * 100);
              },
              child: Column(
                children: categories,
              ))));
    }
    return Expanded(
      child: ListView(
        cacheExtent: double.infinity,
        controller: categoryProvider.getProductsScrollController(),
        padding: const EdgeInsets.all(8),
        children: children,
      ),
    );
  }
}

class ProductoPages extends StatelessWidget {
  final ProductListItem productListItem;

  // ignore: use_key_in_widget_constructors
  const ProductoPages({
    required this.productListItem,
  });

  @override
  Widget build(BuildContext context) {
    return _ModeloPages(
      productListItem: productListItem,
      color: Colors.white,
      colorText: Colors.black,
    );
  }
}

class _ModeloPages extends StatelessWidget {
  final ProductListItem productListItem;
  final Color color;
  final Color colorText;

  // ignore: use_key_in_widget_constructors
  const _ModeloPages({
    required this.productListItem,
    required this.color,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    double precio = productListItem.price;
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          )),
          side: MaterialStateProperty.resolveWith<BorderSide>(
              (Set<MaterialState> states) {
            return const BorderSide(color: Colors.black26, width: 1);
          }),
          shadowColor: MaterialStateProperty.all<Color>(
            Colors.black87,
          ),
          elevation: MaterialStateProperty.all<double>(3),
        ),
        child: SizedBox(
          height: 70,
          width: 280,
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      productListItem.image,
                      width: 55,
                      height: 55,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(productListItem.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          //color: pedidosTheme.secondary,
                          color: colorText,
                          fontSize: 12,
                          fontFamily: pedidosTheme.fonts.textBold,
                        )),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(productListItem.text,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          //color: pedidosTheme.primary,
                          color: colorText,
                          fontSize: 10,
                          fontFamily: pedidosTheme.fonts.text,
                        )),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text('\$$precio',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: colorText,
                          fontSize: 15,
                          fontFamily: pedidosTheme.fonts.textBold,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        onPressed: () {
          productoProvider.initializate(productListItem);
          // seleccionProvider.initializate(const SeleccionarSabores());
          Navigator.pushNamed(context, MenuProductoPages.routeName);
        });
  }
}

// crea el producto simplificado para cuando es seleccionado
class ProductoMenu extends StatelessWidget {
  final ProductListItem productListItem;

  // ignore: use_key_in_widget_constructors
  const ProductoMenu({
    required this.productListItem,
  });

  @override
  Widget build(BuildContext context) {
    double precio = productListItem.price;

    return SizedBox(
      height: 70,
      width: 280,
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  productListItem.image,
                  width: 55,
                  height: 55,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(productListItem.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      //color: pedidosTheme.secondary,
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: pedidosTheme.fonts.textBold,
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 200,
                child: Text(productListItem.text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      //color: pedidosTheme.primary,
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: pedidosTheme.fonts.text,
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 200,
                child: Text('\$$precio',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: pedidosTheme.fonts.textBold,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
