import 'dart:convert';

import 'package:beat/models/roles/client_model.dart';

class ErrorRequestModel {
  int id;
  DateTime send_date;
  String info;
  ClientModel clientmodel;
  ErrorRequestModel({
    required this.id,
    required this.send_date,
    required this.info,
    required this.clientmodel,
  });

  ErrorRequestModel copyWith({
    int? id,
    DateTime? send_date,
    String? info,
    ClientModel? clientmodel,
  }) {
    return ErrorRequestModel(
      id: id ?? this.id,
      send_date: send_date ?? this.send_date,
      info: info ?? this.info,
      clientmodel: clientmodel ?? this.clientmodel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'send_date': send_date.millisecondsSinceEpoch,
      'info': info,
      'clientmodel': clientmodel.toMap(),
    };
  }

  factory ErrorRequestModel.fromMap(Map<String, dynamic> map) {
    return ErrorRequestModel(
      id: map['id'] as int,
      send_date: DateTime.fromMillisecondsSinceEpoch(map['send_date'] as int),
      info: map['info'] as String,
      clientmodel:
          ClientModel.fromMap(map['clientmodel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorRequestModel.fromJson(String source) =>
      ErrorRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ErrorRequestModel(id: $id, send_date: $send_date, info: $info, clientmodel: $clientmodel)';
  }

  @override
  bool operator ==(covariant ErrorRequestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.send_date == send_date &&
        other.info == info &&
        other.clientmodel == clientmodel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        send_date.hashCode ^
        info.hashCode ^
        clientmodel.hashCode;
  }
}
