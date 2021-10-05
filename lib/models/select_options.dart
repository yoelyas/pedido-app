// To parse this JSON data, do
//
//     final hotSaleResponce = hotSaleResponceFromMap(jsonString);

import 'dart:convert';

class ProductOptionsResponce {
  ProductOptionsResponce({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Options data;

  factory ProductOptionsResponce.fromJson(String str) =>
      ProductOptionsResponce.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductOptionsResponce.fromMap(Map<String, dynamic> json) =>
      ProductOptionsResponce(
        statusCode: json["status_code"],
        data: Options.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status_code": statusCode,
        "data": data.toMap(),
      };
}

class Options {
  Options({
    required this.id,
    required this.title,
    required this.text,
    required this.price,
    required this.image,
    required this.stock,
    required this.onlyCash,
    required this.tags,
    required this.products,
  });

  String id;
  String title;
  String text;
  double price;
  String image;
  int stock;
  bool onlyCash;
  List<String> tags;
  List<Product> products;

  factory Options.fromJson(String str) => Options.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Options.fromMap(Map<String, dynamic> json) => Options(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        price: json["price"],
        image: json["image"],
        stock: json["stock"],
        onlyCash: json["onlyCash"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        products:
            List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "text": text,
        "price": price,
        "image": image,
        "stock": stock,
        "onlyCash": onlyCash,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
      };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.stock,
    required this.length,
    required this.minLength,
    required this.maxLength,
    required this.options,
  });

  String id;
  String title;
  int stock;
  int? length;
  int minLength;
  int? maxLength;
  List<ProductOption> options;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        stock: json["stock"],
        length: json["length"],
        minLength: json["minLength"],
        maxLength: json["maxLength"],
        options: List<ProductOption>.from(
            json["options"].map((x) => ProductOption.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "stock": stock,
        "length": length,
        "minLength": minLength,
        "maxLength": maxLength,
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
      };
}

class ProductOption {
  ProductOption({
    required this.title,
    required this.button,
    required this.length,
    required this.minLength,
    required this.maxLength,
    required this.maxLengthPerOption,
    required this.aditionalOffset,
    required this.pricePerAditional,
    required this.msg,
    required this.options,
  });

  String title;
  String button;
  dynamic length;
  int minLength;
  int? maxLength;
  int? maxLengthPerOption;
  int? aditionalOffset;
  double pricePerAditional;
  Msg msg;
  List<OptionOption> options;

  factory ProductOption.fromJson(String str) =>
      ProductOption.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductOption.fromMap(Map<String, dynamic> json) => ProductOption(
        title: json["title"],
        button: json["button"],
        length: json["length"],
        minLength: json["minLength"],
        maxLength: json["maxLength"],
        maxLengthPerOption: json["maxLengthPerOption"],
        aditionalOffset: json["aditionalOffset"],
        pricePerAditional: json["pricePerAditional"],
        msg: Msg.fromMap(json["msg"]),
        options: List<OptionOption>.from(
            json["options"].map((x) => OptionOption.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "button": button,
        "length": length,
        "minLength": minLength,
        "maxLength": maxLength,
        "maxLengthPerOption": maxLengthPerOption,
        "aditionalOffset": aditionalOffset,
        "pricePerAditional": pricePerAditional,
        "msg": msg.toMap(),
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
      };
}

class Msg {
  Msg({
    required this.empty,
    required this.aditionalOffset,
  });

  String empty;
  String? aditionalOffset;

  factory Msg.fromJson(String str) => Msg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Msg.fromMap(Map<String, dynamic> json) => Msg(
        empty: json["empty"],
        aditionalOffset: json["aditionalOffset"],
      );

  Map<String, dynamic> toMap() => {
        "empty": empty,
        "aditionalOffset": aditionalOffset,
      };
}

class OptionOption {
  OptionOption({
    required this.id,
    required this.title,
    required this.description,
    required this.stock,
    required this.price,
  });

  String id;
  String title;
  String description;
  int stock;
  double? price;

  factory OptionOption.fromJson(String str) =>
      OptionOption.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OptionOption.fromMap(Map<String, dynamic> json) => OptionOption(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        stock: json["stock"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "stock": stock,
        "price": price,
      };
}
