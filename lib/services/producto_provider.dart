import 'package:flutter/material.dart';
import 'package:tufic_app/models/product_list_item.dart';

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