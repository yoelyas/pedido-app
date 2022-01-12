import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:pedidos_app/models/select_options.dart';

class SelectedOptionsProvider extends ChangeNotifier {
  late List<Product> productList;
  // una propiedad marca de tiempo como para no
  ProductOption? _product;
  String _status = 'no_inicializado';
  String _json = "";

  Future<List<Product>> getProductList() async {
    final body = await rootBundle.loadString('collections/products/e5.json');
    productList = ProductOptionsResponce.fromJson(body).data.products;
    notifyListeners();
    return productList;
  }

  /// Inicializar carrito de compras
  initializate(ProductOption producto) {
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
  _setProducto(ProductOption? producto) => _product = producto;
  _setStatus(String status) => _status = status;
  setJson(String json) => _json = json;

  // Getters
  ProductOption? getProducto() => _product;
  String getStatus() => _status;
  String getJson() => _json;
}
