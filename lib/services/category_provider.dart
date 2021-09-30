import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CategoryProvider with ChangeNotifier {
  /// La categoria puede seleccionarse desde el menu categorias o desde menu de productos
  String _seletedCategory = '';
  List<String> categoryList = [];
  Map<String, double> categoryVisibility = {};

  /// bandera de control de scroll cruzado entre categorias y productos
  bool scrolling = false;

  final _categoriesScrollController = AutoScrollController();
  final _productosScrollController = AutoScrollController();

  String getSelected() => _seletedCategory;

  void setSelectedCategory(String category) {
    _seletedCategory = category;
  }

  setCategoryList(List<String> categoryList) {
    this.categoryList = categoryList;
    categoryVisibility = {};
    for (var item in categoryList) {
      categoryVisibility[item] = 0;
    }
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
    if (categoryList.contains(category)) {
      scrolling = true;
      setSelectedCategory(category);
      getCategoriesScrollController().scrollToIndex(getCategoryIndex(category),
          preferPosition: AutoScrollPosition.begin);

      getProductsScrollController().scrollToIndex(getCategoryIndex(category),
          preferPosition: AutoScrollPosition.begin);
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

  void _selectCategoryAlt(int indexCategory, String category) {
    if (!isSelected(category)) {
      setSelectedCategory(category);
      getCategoriesScrollController().scrollToIndex(indexCategory,
          preferPosition: AutoScrollPosition.begin);
    }
  }

  void onScroll(String category, double visibility) {
    categoryVisibility[category] = visibility;

    if (scrolling) {
      if (categoryVisibility[getSelected()]! > 0) {
        scrolling = false;
      }
    } else if (!isSelected(category)) {
      for (var index = 0; index < categoryList.length; index++) {
        if (index == 0 && categoryVisibility[getCategoryByIndex(index)]! > 0) {
          // la primera
          _selectCategoryAlt(index, getCategoryByIndex(index));
        } else if (0 < index &&
            index < (categoryList.length - 1) &&
            categoryVisibility[getCategoryByIndex(index)]! > 0 &&
            categoryVisibility[getCategoryByIndex(index - 1)]! <= 1) {
          // del medio
          _selectCategoryAlt(index, getCategoryByIndex(index));
        } else if (index == (categoryList.length - 1) &&
            categoryVisibility[getCategoryByIndex(index)]! >= 99) {
          // ultima
          _selectCategoryAlt(index, getCategoryByIndex(index));
        }
      }
    }
  }
}
