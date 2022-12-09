// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:beat/models/roles/licensor_model.dart';

class ProductModel {
  String id_product;
  String name;
  String music;
  String image;
  int price;
  String duration;
  int bpm;
  String genre;
  String key;
  String info;
  LicensorModel licensor_model;
  DateTime publish_date;
  ProductModel({
    required this.id_product,
    required this.name,
    required this.music,
    required this.image,
    required this.price,
    required this.duration,
    required this.bpm,
    required this.genre,
    required this.key,
    required this.info,
    required this.licensor_model,
    required this.publish_date,
  });

  ProductModel copyWith({
    String? id_product,
    String? name,
    String? music,
    String? image,
    int? price,
    String? duration,
    int? bpm,
    String? genre,
    String? key,
    String? info,
    LicensorModel? licensor_model,
    DateTime? publish_date,
  }) {
    return ProductModel(
      id_product: id_product ?? this.id_product,
      name: name ?? this.name,
      music: music ?? this.music,
      image: image ?? this.image,
      price: price ?? this.price,
      duration: duration ?? this.duration,
      bpm: bpm ?? this.bpm,
      genre: genre ?? this.genre,
      key: key ?? this.key,
      info: info ?? this.info,
      licensor_model: licensor_model ?? this.licensor_model,
      publish_date: publish_date ?? this.publish_date,
    );
  }

  // 'name': name,
  //           'price': price,
  //           'key': key,
  //           'info': info,
  //           'genre': genre,
  //           'duration': duration,
  //           'bpm': bpm

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_product': id_product,
      'name': name,
      'music': music,
      'image': image,
      'price': price,
      'duration': duration,
      'bpm': bpm,
      'genre': genre,
      'key': key,
      'info': info,
      'licensor_model': licensor_model.toMap(),
      'publish_date': publish_date.millisecondsSinceEpoch,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id_product: map['id_product'] as String,
      name: map['name'] as String,
      music: map['music'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
      duration: map['duration'] as String,
      bpm: map['bpm'] as int,
      genre: map['genre'] as String,
      key: map['key'] as String,
      info: map['info'] as String,
      licensor_model:
          LicensorModel.fromMap(map['licensor_model'] as Map<String, dynamic>),
      publish_date:
          DateTime.fromMillisecondsSinceEpoch(map['publish_date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id_product: $id_product, name: $name, music: $music, image: $image, price: $price, duration: $duration, bpm: $bpm, genre: $genre, key: $key, info: $info, licensor_model: $licensor_model, publish_date: $publish_date)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id_product == id_product &&
        other.name == name &&
        other.music == music &&
        other.image == image &&
        other.price == price &&
        other.duration == duration &&
        other.bpm == bpm &&
        other.genre == genre &&
        other.key == key &&
        other.info == info &&
        other.licensor_model == licensor_model &&
        other.publish_date == publish_date;
  }

  @override
  int get hashCode {
    return id_product.hashCode ^
        name.hashCode ^
        music.hashCode ^
        image.hashCode ^
        price.hashCode ^
        duration.hashCode ^
        bpm.hashCode ^
        genre.hashCode ^
        key.hashCode ^
        info.hashCode ^
        licensor_model.hashCode ^
        publish_date.hashCode;
  }
}
