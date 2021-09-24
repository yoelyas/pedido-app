import 'package:flutter/material.dart';
import 'package:tufic_app/const/config.dart';
import 'package:tufic_app/const/tufic_theme.dart';
import 'package:tufic_app/models/product_list_item.dart';

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

class PromosPages extends StatelessWidget {
  final ProductListItem productListItem;

  // ignore: use_key_in_widget_constructors
  const PromosPages({
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

class ProductListPage extends StatelessWidget {
  final List<ProductListItem> productList;
  // ignore: use_key_in_widget_constructors
  const ProductListPage({
    required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    for (var productListItem in productList) {
      children.add(ProductoPages(productListItem: productListItem));
      children.add(
        const SizedBox(
          height: 15,
        ),
      );
    }
    return Column(
      children: children,
    );
  }
}

class ProductoSimplificado extends StatelessWidget {
  final ProductListItem productListItem;

  // ignore: use_key_in_widget_constructors
  const ProductoSimplificado({
    required this.productListItem,
  });

  @override
  Widget build(BuildContext context) {
    double precio = productListItem.price;
    double ancho = 200;
    double alto = 300;

    return SizedBox(
      height: alto * 0.3,
      width: ancho * 0.9,
      child: Row(
        children: [
          Container(
            color: Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Align(
                heightFactor: alto * 0.0018,
                widthFactor: ancho * 0.0018,
                child: Image.network(productListItem.image),
              ),
            ),
          ),
          SizedBox(
            width: ancho * 0.1,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ancho * 0.5,
                child: Text(productListItem.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: alto * 0.04,
                      fontFamily: tuficTheme.fonts.title,
                    )),
              ),
              SizedBox(
                width: ancho * 0.5,
                child: Text(productListItem.text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: alto * 0.04,
                      fontFamily: tuficTheme.fonts.text,
                    )),
              ),
              SizedBox(
                width: ancho * 0.5,
                child: Text('\$$precio',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: alto * 0.05,
                      fontFamily: tuficTheme.fonts.title,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
