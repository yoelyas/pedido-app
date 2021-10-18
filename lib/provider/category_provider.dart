import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:throttling/throttling.dart';

//se usa para mover los listviw en productos_pages
class CategoryProvider with ChangeNotifier {
  String _selectedCategory = '';
  List<String> categoryList = [];
  Map<String, int> categoryVisibility = {};

  //mueve el Listviw de categorias
  final _categoriesScrollController = AutoScrollController();
  //mueve el listviw de productos
  final _productsScrollController = AutoScrollController();

// añade un delay a la hora de scrolear los Listiw
  final _debouncer = Debouncing(duration: const Duration(milliseconds: 500));

  CategoryProvider() {
    _productsScrollController.addListener(() {
      _debouncer.debounce(() {
        asyncSelectCategory();
      });
    });
  }

  String getSelected() => _selectedCategory;
  List<String> getCategoryList() => categoryList;
  String getCategoryByIndex(int index) => categoryList[index];

  bool isSelected(String category) => (category == _selectedCategory);

  void setSelectedCategory(String category) {
    if (exists(category)) {
      _selectedCategory = category;
    } else {
      _selectedCategory = '';
    }
  }

  bool exists(String category) {
    for (var item in categoryList) {
      if (item == category) {
        return true;
      }
    }
    return false;
  }

  setCategoryList(List<String> categoryList) {
    this.categoryList = categoryList;
    if (!exists(_selectedCategory) && categoryList.isNotEmpty) {
      setSelectedCategory(categoryList[0]);
    }
  }

  resetVisibility() {
    categoryVisibility = {};
    for (var item in categoryList) {
      categoryVisibility[item] = 0;
    }
  }

  int getCategoryIndex(String category) {
    for (var i = 0; i < categoryList.length; i++) {
      if (categoryList[i] == category) {
        return i;
      }
    }

    return 0;
  }

// setea y mueve los listviw segun la caategoria seleccionada
  goToCategory(String category) {
    setSelectedCategory(category);
    notifyListeners();

    _categoriesScrollController.scrollToIndex(getCategoryIndex(category),
        preferPosition: AutoScrollPosition.begin);

    _productsScrollController.scrollToIndex(getCategoryIndex(category),
        preferPosition: AutoScrollPosition.begin);
  }

  AutoScrollController getCategoriesScrollController() =>
      _categoriesScrollController;
  AutoScrollController getProductsScrollController() =>
      _productsScrollController;

// cambia la categoria seleccionada segun la visivilidad y cual aparese primero
  void asyncSelectCategory() {
    // por defecto, primer cat seleccionada
    int index = 0;
    dynamic scrollController = getProductsScrollController();
    String maxScrollExtent =
        scrollController.position.maxScrollExtent.toStringAsFixed(0);
    String offset = scrollController.offset.toStringAsFixed(0);
    bool isScrollEnd = (offset == maxScrollExtent);
    if (isScrollEnd && categoryVisibility[getSelected()]! > 0) {
      index = getCategoryIndex(getSelected());
    } else if (isScrollEnd && categoryVisibility[getSelected()]! == 0) {
      index = getCategoryList().length - 1;
    } else {
      for (var i = 0; i < categoryList.length; i++) {
        if (categoryVisibility[getCategoryByIndex(i)]! > 0) {
          index = i;
          break;
        }
      }
    }

    String category = getCategoryByIndex(index);

    if (!isSelected(getCategoryByIndex(index))) {
      setSelectedCategory(category);
      notifyListeners();
      _categoriesScrollController.scrollToIndex(getCategoryIndex(category),
          preferPosition: AutoScrollPosition.begin);
    }
  }

  void setCategoryVisibility(String category, double visibility) {
    categoryVisibility[category] = visibility.floor();
  }
}
