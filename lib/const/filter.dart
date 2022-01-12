import 'package:pedidos_app/models/product_list_item.dart';

class Filter {
  String _text = '';

  List<ProductListItem> filter(List<ProductListItem> productList) {
    if (_text.isEmpty) return productList;
    List<ProductListItem> filtered = [];
    for (var element in productList) {
      if (contains(element.category) ||
          contains(element.text) ||
          contains(element.title) ||
          contains(element.tags.toString()) ||
          contains(element.price.toString())) {
        filtered.add(element);
      }
    }
    return filtered;
  }

  void reset() => _text = '';

  setSearchText(String text) => _text = text;

  String getText() => _text;
  String getTextLowerCase() => _text.toLowerCase();

  bool contains(String text) {
    return (text.toLowerCase().contains(getTextLowerCase()));
  }
}
