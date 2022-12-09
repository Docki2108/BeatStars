import 'dart:convert';

import 'package:beat/models/product_model.dart';

class CatalogModel {
  int id;
  String name;
  String info;
  ProductModel productModel;
  CatalogModel({
    required this.id,
    required this.name,
    required this.info,
    required this.productModel,
  });

  CatalogModel copyWith({
    int? id,
    String? name,
    String? info,
    ProductModel? productModel,
  }) {
    return CatalogModel(
      id: id ?? this.id,
      name: name ?? this.name,
      info: info ?? this.info,
      productModel: productModel ?? this.productModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'info': info,
      'productModel': productModel.toMap(),
    };
  }

  factory CatalogModel.fromMap(Map<String, dynamic> map) {
    return CatalogModel(
      id: map['id'] as int,
      name: map['name'] as String,
      info: map['info'] as String,
      productModel:
          ProductModel.fromMap(map['productModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CatalogModel.fromJson(String source) =>
      CatalogModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CatalogModel(id: $id, name: $name, info: $info, productModel: $productModel)';
  }

  @override
  bool operator ==(covariant CatalogModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.info == info &&
        other.productModel == productModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ info.hashCode ^ productModel.hashCode;
  }
}
