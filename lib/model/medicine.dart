// To parse this JSON data, do
//
//     final medicine = medicineFromJson(jsonString);

import 'dart:convert';

Medicine medicineFromJson(String str) => Medicine.fromJson(json.decode(str));

String medicineToJson(Medicine data) => json.encode(data.toJson());

class Medicine {
  Medicine({
    this.id,
    this.isDiscontinued,
    this.manufacturerName,
    this.unitPrice,
    this.name,
    this.skuId,
    this.available,
    this.packSizeLabel,
    this.isPrescriptionRequired,
    this.shortComposition,
    this.imageUrl,
    this.packSize,
  });

  String id;
  bool isDiscontinued;
  String manufacturerName;
  double unitPrice;
  String name;
  int skuId;
  bool available;
  String packSizeLabel;
  bool isPrescriptionRequired;
  String shortComposition;
  String imageUrl;
  int packSize;

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["_id"],
        isDiscontinued: json["isDiscontinued"],
        manufacturerName: json["manufacturerName"],
        unitPrice: json["unitPrice"].toDouble(),
        name: json["name"],
        skuId: json["skuId"],
        available: json["available"],
        packSizeLabel: json["packSizeLabel"],
        isPrescriptionRequired: json["isPrescriptionRequired"],
        shortComposition: json["shortComposition"],
        imageUrl: json["imageUrl"],
        packSize: json["packSize"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isDiscontinued": isDiscontinued,
        "manufacturerName": manufacturerName,
        "unitPrice": unitPrice,
        "name": name,
        "skuId": skuId,
        "available": available,
        "packSizeLabel": packSizeLabel,
        "isPrescriptionRequired": isPrescriptionRequired,
        "shortComposition": shortComposition,
        "imageUrl": imageUrl,
        "packSize": packSize,
      };
}
