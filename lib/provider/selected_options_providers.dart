import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:tufic_app/models/select_options.dart';

class SelectedOptionsProvider extends ChangeNotifier {
  late Options productList;
  // una propiedad marca de tiempo como para no

  Future<Options> getProductList() async {
    final body = await rootBundle.loadString('collections/products/a1.json');
    productList = ProductOptionsResponce.fromJson(body).data;
    notifyListeners();
    return productList;
  }
}
