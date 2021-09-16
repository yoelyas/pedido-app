import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  String _store = "";
  String _status = 'no_inicializado';

  /// Inicializar carrito de compras
  initializate(String store) {
    _setStore(store);
    _setStatus('inicializado');
    notifyListeners();
  }

  /// Limpiar carrito
  clear() {
    _setStore('');
    _setStatus('no_inicializado');
    notifyListeners();
  }

  /// Setters
  _setStore(String store) => _store = store;
  _setStatus(String status) => _status = status;

  // Getters
  String getStore() => _store;
  String getStatus() => _status;
}
