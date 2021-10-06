import 'package:flutter/material.dart';

//setea la seleccion de sabores una ves seleccionado el producto
class SeleccionProvider extends ChangeNotifier {
  Widget? _product;
  String _status = 'no_inicializado';

  /// Inicializar carrito de compras
  initializate(Widget producto) {
    _setSeleccion(producto);
    _setStatus('inicializado');
    notifyListeners();
  }

  /// Limpiar carrito
  clear() {
    _setSeleccion(null);
    _setStatus('no_inicializado');
    notifyListeners();
  }

  /// Setters
  _setSeleccion(Widget? producto) => _product = producto;
  _setStatus(String status) => _status = status;

  // Getters
  Widget? getSeleccion() => _product;
  String getStatus() => _status;
}
