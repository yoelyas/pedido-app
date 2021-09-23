import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:tufic_app/models/product.dart';

class HotSale extends ChangeNotifier {
  Future<List<Article>> getHotList() async {
    final body = await rootBundle.loadString('collections/products/e5.json');
    List<Article> articles = Data.fromJson(body).articles;
    notifyListeners();

    return articles;
  }
}
