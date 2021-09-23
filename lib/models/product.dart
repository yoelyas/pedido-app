// To parse this JSON data, do
//
//     final hotSaleResponce = hotSaleResponceFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison
import 'dart:convert';

class HotSaleResponce {
  HotSaleResponce({
    required this.statusCode,
    required this.data,
  });

  int statusCode;
  Data data;

  factory HotSaleResponce.fromJson(String str) =>
      HotSaleResponce.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HotSaleResponce.fromMap(Map<String, dynamic> json) => HotSaleResponce(
        statusCode: json["status_code"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status_code": statusCode,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.text,
    required this.price,
    required this.image,
    required this.stock,
    required this.onlyCash,
    required this.tags,
    required this.articles,
  });

  String id;
  String title;
  String text;
  double price;
  String image;
  int stock;
  bool onlyCash;
  List<String> tags;
  List<Article> articles;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        text: json["text"],
        price: json["price"],
        image: json["image"],
        stock: json["stock"],
        onlyCash: json["onlyCash"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        articles:
            List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
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
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
      };
}

class Article {
  Article({
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
  int length;
  int minLength;
  int maxLength;
  List<ArticleOption> options;

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        stock: json["stock"],
        length: json["length"],
        minLength: json["minLength"],
        maxLength: json["maxLength"],
        options: List<ArticleOption>.from(
            json["options"].map((x) => ArticleOption.fromMap(x))),
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

class ArticleOption {
  ArticleOption({
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
  int length;
  int minLength;
  int maxLength;
  int maxLengthPerOption;
  int aditionalOffset;
  int pricePerAditional;
  Msg msg;
  List<OptionOption> options;

  factory ArticleOption.fromJson(String str) =>
      ArticleOption.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ArticleOption.fromMap(Map<String, dynamic> json) => ArticleOption(
        title: json["title"],
        button: json["button"],
        length: json["length"] == null ? null : json["length"],
        minLength: json["minLength"],
        maxLength: json["maxLength"] == null ? null : json["maxLength"],
        maxLengthPerOption: json["maxLengthPerOption"],
        aditionalOffset:
            json["aditionalOffset"] == null ? null : json["aditionalOffset"],
        pricePerAditional: json["pricePerAditional"],
        msg: Msg.fromMap(json["msg"]),
        options: List<OptionOption>.from(
            json["options"].map((x) => OptionOption.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "button": button,
        "length": length == null ? null : length,
        "minLength": minLength,
        "maxLength": maxLength == null ? null : maxLength,
        "maxLengthPerOption": maxLengthPerOption,
        "aditionalOffset": aditionalOffset == null ? null : aditionalOffset,
        "pricePerAditional": pricePerAditional,
        "msg": msg.toMap(),
        "options": List<dynamic>.from(options.map((x) => x.toMap())),
      };
}

class Msg {
  Msg({
    required this.empty,
  });

  String empty;

  factory Msg.fromJson(String str) => Msg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Msg.fromMap(Map<String, dynamic> json) => Msg(
        empty: json["empty"],
      );

  Map<String, dynamic> toMap() => {
        "empty": empty,
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
  double price;

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
