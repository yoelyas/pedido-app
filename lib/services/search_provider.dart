import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tufic_app/models/product_list_item.dart';

class SearchProvider with ChangeNotifier {
  String busqueda = "";

  List<ProductListItem> filter(List<ProductListItem> productList) {
    if (busqueda.isEmpty) return productList;
    List<ProductListItem> filtered = [];
    for (var element in productList) {
      if (element.category.toLowerCase().contains(getSearch().toLowerCase()) ||
          element.text.toLowerCase().contains(getSearch().toLowerCase()) ||
          element.title.toLowerCase().contains(getSearch().toLowerCase()) ||
          element.tags.contains(getSearch().toLowerCase()) ||
          element.price.toString().contains(getSearch().toLowerCase())) {
        filtered.add(element);
      }

      //.toLowerCase().contains(getSearch().toLowerCase()))

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
