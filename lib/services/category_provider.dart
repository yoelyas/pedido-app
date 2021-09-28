import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CategoryProvider with ChangeNotifier {
  /// La categoria puede seleccionarse desde el menu categorias o desde menu de productos
  String _seletedCategory = '';
  List<String> categoryList = [];

  final _categoriesScrollController = AutoScrollController();
  final _productosScrollController = AutoScrollController();

  String getSelected() => _seletedCategory;

  void setSelectedCategory(String category) {
    _seletedCategory = category;
  }

  setCategoryList(List<String> categoryList) {
    this.categoryList = categoryList;
  }

  List<String> getCategoryList() {
    return categoryList;
  }

  String getCategoryByIndex(int index) {
    if (index >= categoryList.length) {
      return "";
    }
    return categoryList[index];
  }

  int getCategoryIndex(String category) {
    for (var i = 0; i < categoryList.length; i++) {
      if (categoryList[i] == category) {
        return i;
      }
    }
    //debuelvo negativo para asegurar que si no esta no tome ningun valor
    return -1;
  }

  selectCategory(String category) {
    if (!isSelected(category)) {
      setSelectedCategory(category);
      _categoriesScrollController.scrollToIndex(getCategoryIndex(category),
          preferPosition: AutoScrollPosition.begin);
      //refreshView();
    }
  }

  bool isSelected(String category) {
    return category == _seletedCategory;
  }

  void refreshView() => notifyListeners();

  AutoScrollController getCategoriesScrollController() =>
      _categoriesScrollController;
  AutoScrollController getProductsScrollController() =>
      _productosScrollController;

  /*Future scrollToIndex(int index) => _categoriesScrollController
      .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);*/
}
