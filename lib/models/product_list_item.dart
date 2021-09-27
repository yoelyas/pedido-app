import 'dart:convert';

class ProductListItem {
  ProductListItem({
    required this.id,
    required this.title,
    required this.text,
    required this.price,
    required this.image,
    required this.stock,
    required this.onlyCash,
    required this.category,
    required this.tags,
  });

  String id;
  String title;
  String text;
  double price;
  String image;
  dynamic stock;
  bool onlyCash;
  String category;
  List<String> tags;

  factory ProductListItem.fromJson(String str) =>
      ProductListItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductListItem.fromMap(Map<String, dynamic> json) => ProductListItem(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        price: json["price"],
        image: json["image"],
        stock: json["stock"],
        onlyCash: json["onlyCash"],
        category: json["category"],
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "text": text,
        "price": price,
        "image": image,
        "stock": stock,
        "onlyCash": onlyCash,
        "category": category,
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
