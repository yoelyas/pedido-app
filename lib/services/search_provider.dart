import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tufic_app/models/product_list_item.dart';

class SearchProvider with ChangeNotifier {
  String busqueda = "";

  List<ProductListItem> filter(List<ProductListItem> productList) {
    if (busqueda.isEmpty) return productList;
    List<ProductListItem> filtered = [];
    for (var element in productList) {
      if (element.category == getSearch()) filtered.add(element);
    }
    return filtered;
  }

  setSearch(String text) {
    if (text.length > 1) {
      busqueda = '${text[0].toUpperCase()}${text.substring(1)}';
    } else {
      busqueda = text;
    }
  }

  String getSearch() => busqueda;
}
