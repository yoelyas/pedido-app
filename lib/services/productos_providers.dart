import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:tufic_app/models/product_list_item.dart';
import 'package:tufic_app/models/product_list_response.dart';

// llama y setea la lista de producto
class ProductosProvider extends ChangeNotifier {
  List<ProductListItem> productList = [];
  // una propiedad marca de tiempo como para no

  Future<List<ProductListItem>> getProductList() async {
    if (productList.isNotEmpty) return productList;

    final body = await rootBundle.loadString('collections/productList.json');
    productList = ProductListResponse.fromJson(body).data;
    // notifyListeners();
    return productList;
  }
}
