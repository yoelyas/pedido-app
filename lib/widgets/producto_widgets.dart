import 'package:flutter/material.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/models/product_list_item.dart';

class ProductListPage extends StatelessWidget {
  final List<ProductListItem> productList;
  final List<String> categorias;
  // ignore: use_key_in_widget_constructors
  const ProductListPage({
    required this.productList,
    required this.categorias,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (var category in categorias) {
      children.add(SizedBox(
        width: 280,
        child: Text(category,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: tuficTheme.fonts.textBold,
            )),
      ));
      for (var productListItem in productList) {
        if (category == productListItem.category) {
          children.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductoPages(productListItem: productListItem),
          ));
        }
      }
    }
    return Column(
      children: children,
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
      color: tuficTheme.primary,
      colorText: Colors.white,
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
    double precio = productListItem.price;

    //final productoProvider = Provider.of<ProductosProvider>(context);
    // final seleccionProvider = Provider.of<SeleccionProvider>(context);
    // ignore: unused_local_variable
    // final hotsaleProvider = Provider.of<HotSale>(context);

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
                          //color: tuficTheme.secondary,
                          color: colorText,
                          fontSize: 12,
                          fontFamily: tuficTheme.fonts.textBold,
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
                          //color: tuficTheme.primary,
                          color: colorText,
                          fontSize: 10,
                          fontFamily: tuficTheme.fonts.text,
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
                          fontFamily: tuficTheme.fonts.textAccent,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        onPressed: () {
          // productoProvider.initializate(productListItem);
          /*seleccionProvider.initializate(SeleccionarSabores(
            ancho: ancho,
          ));*/
          //Navigator.pushReplacementNamed(context, MenuPage.routeName);
        });
  }
}
