// To parse this JSON data, do
//
//     final healthcare = healthcareFromJson(jsonString);

import 'dart:convert';

HealthCare healthcareFromJson(String str) =>
    HealthCare.fromJson(json.decode(str));

String healthcareToJson(HealthCare data) => json.encode(data.toJson());

class HealthCare {
  HealthCare({
    this.category,
    this.available,
    this.id,
    this.name,
    this.packSizeLabel,
    this.price,
    this.skuId,
    this.packSize,
  });

  List<String> category;
  bool available;
  String id;
  String name;
  String packSizeLabel;
  int price;
  int skuId;
  int packSize;

  factory HealthCare.fromJson(Map<String, dynamic> json) => HealthCare(
        category: List<String>.from(json["category"].map((x) => x as String)),
        available: json["available"],
        id: json["_id"],
        name: json["name"],
        packSizeLabel: json["packSizeLabel"],
        price: json["price"].toInt(),
        skuId: json["skuId"],
        packSize: json["packSize"],
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x)),
        "available": available,
        "_id": id,
        "name": name,
        "packSizeLabel": packSizeLabel,
        "price": price,
        "skuId": skuId,
        "packSize": packSize,
      };
}
