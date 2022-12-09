import 'dart:convert';

import 'package:beat/models/product_model.dart';

class LicenseModel {
  int id;
  String info;
  String type;
  ProductModel productModel;
  LicenseModel({
    required this.id,
    required this.info,
    required this.type,
    required this.productModel,
  });

  LicenseModel copyWith({
    int? id,
    String? info,
    String? type,
    ProductModel? productModel,
  }) {
    return LicenseModel(
      id: id ?? this.id,
      info: info ?? this.info,
      type: type ?? this.type,
      productModel: productModel ?? this.productModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'info': info,
      'type': type,
      'productModel': productModel.toMap(),
    };
  }

  factory LicenseModel.fromMap(Map<String, dynamic> map) {
    return LicenseModel(
      id: map['id'] as int,
      info: map['info'] as String,
      type: map['type'] as String,
      productModel:
          ProductModel.fromMap(map['productModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LicenseModel.fromJson(String source) =>
      LicenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LicenseModel(id: $id, info: $info, type: $type, productModel: $productModel)';
  }

  @override
  bool operator ==(covariant LicenseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.info == info &&
        other.type == type &&
        other.productModel == productModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^ info.hashCode ^ type.hashCode ^ productModel.hashCode;
  }
}
