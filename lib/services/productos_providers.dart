import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/models/product_list_response.dart';

class ProductosProvider extends ChangeNotifier {
  List<ProductListItem> productList = [];
  // una propiedad marca de tiempo como para no

  Future<List<ProductListItem>> getProductList() async {
    final body = await rootBundle.loadString('collections/productList.json');
    productList = ProductListResponse.fromJson(body).data;
    notifyListeners();
    return productList;
  }
}

/* tengo que revisarlo 
class ProductoProvider extends ChangeNotifier {
  ProductListItem? _product;
  String _status = 'no_inicializado';

  /// Inicializar carrito de compras
  initializate(ProductListItem producto) {
    _setProducto(producto);
    _setStatus('inicializado');
    notifyListeners();
  }

  /// Limpiar carrito
  clear() {
    _setProducto(null);
    _setStatus('no_inicializado');
    notifyListeners();
  }

  /// Setters
  _setProducto(ProductListItem? producto) => _product = producto;
  _setStatus(String status) => _status = status;

  // Getters
  ProductListItem? getProducto() => _product;
  String getStatus() => _status;
}

*/