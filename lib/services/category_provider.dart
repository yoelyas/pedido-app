import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  String _seletedCategory = '';

  String getCategory() => _seletedCategory;

  void setCategory(String valor) {
    _seletedCategory = valor;
  }

  bool isSelected(String category) {
    return category == _seletedCategory;
  }

  void refreshView() => notifyListeners();
}
