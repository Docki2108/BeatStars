import 'dart:convert';

import 'package:beat/models/errorrequest_model.dart';
import 'package:beat/models/roles/operator_model.dart';

class ErrorMessage {
  int id;
  String info;
  bool status;
  OperatorModel operatorModel;
  ErrorRequestModel errorRequestModel;
  ErrorMessage({
    required this.id,
    required this.info,
    required this.status,
    required this.operatorModel,
    required this.errorRequestModel,
  });

  ErrorMessage copyWith({
    int? id,
    String? info,
    bool? status,
    OperatorModel? operatorModel,
    ErrorRequestModel? errorRequestModel,
  }) {
    return ErrorMessage(
      id: id ?? this.id,
      info: info ?? this.info,
      status: status ?? this.status,
      operatorModel: operatorModel ?? this.operatorModel,
      errorRequestModel: errorRequestModel ?? this.errorRequestModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'info': info,
      'status': status,
      'operatorModel': operatorModel.toMap(),
      'errorRequestModel': errorRequestModel.toMap(),
    };
  }

  factory ErrorMessage.fromMap(Map<String, dynamic> map) {
    return ErrorMessage(
      id: map['id'] as int,
      info: map['info'] as String,
      status: map['status'] as bool,
      operatorModel:
          OperatorModel.fromMap(map['operatorModel'] as Map<String, dynamic>),
      errorRequestModel: ErrorRequestModel.fromMap(
          map['errorRequestModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ErrorMessage.fromJson(String source) =>
      ErrorMessage.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ErrorMessage(id: $id, info: $info, status: $status, operatorModel: $operatorModel, errorRequestModel: $errorRequestModel)';
  }

  @override
  bool operator ==(covariant ErrorMessage other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.info == info &&
        other.status == status &&
        other.operatorModel == operatorModel &&
        other.errorRequestModel == errorRequestModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        info.hashCode ^
        status.hashCode ^
        operatorModel.hashCode ^
        errorRequestModel.hashCode;
  }
}
