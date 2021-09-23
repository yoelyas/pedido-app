// To parse this JSON data, do
//
//     final ProductListResponse = ProductListResponseFromMap(jsonString);

import 'dart:convert';
import 'product_list_item.dart';

class ProductListResponse {
  ProductListResponse({
    required this.statusCode,
    required this.total,
    required this.filtered,
    required this.showing,
    required this.data,
  });

  int statusCode;
  int total;
  int filtered;
  int showing;
  List<ProductListItem> data;

  factory ProductListResponse.fromJson(String str) =>
      ProductListResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductListResponse.fromMap(Map<String, dynamic> json) =>
      ProductListResponse(
        statusCode: json["status_code"],
        total: json["total"],
        filtered: json["filtered"],
        showing: json["showing"],
        data: List<ProductListItem>.from(
            json["data"].map((x) => ProductListItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status_code": statusCode,
        "total": total,
        "filtered": filtered,
        "showing": showing,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}
