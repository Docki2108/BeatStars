// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:beat/models/roles/admin_model.dart';
import 'package:beat/models/roles/client_model.dart';
import 'package:beat/models/roles/operator_model.dart';
import 'package:beat/view/important_widgets/widgets.dart';

import 'roles/licensor_model.dart';

class UserModel {
  static UserModel? _User;

  ClientModel? client;
  OperatorModel? operator;
  AdminModel? admin;
  LicensorModel? licensor;

  UserModel._({
    required this.client,
    required this.operator,
    required this.admin,
    required this.licensor,
  });

  factory UserModel({
    ClientModel? client,
    OperatorModel? operator,
    AdminModel? admin,
    LicensorModel? licensor,
  }) =>
      _User ??= UserModel._(
          client: client, operator: operator, admin: admin, licensor: licensor);

  void clear() {
    _User = null;
  }

  UserModel copyWith({
    ClientModel? client,
    OperatorModel? operator,
    AdminModel? admin,
    LicensorModel? licensor,
  }) {
    return UserModel(
      client: client ?? this.client,
      operator: operator ?? this.operator,
      admin: admin ?? this.admin,
      licensor: licensor ?? this.licensor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'client': client?.toMap(),
      'operator': operator?.toMap(),
      'admin': admin?.toMap(),
      'licensor': licensor?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      client: map['client'] != null
          ? ClientModel.fromMap(map['client'] as Map<String, dynamic>)
          : null,
      operator: map['operator'] != null
          ? OperatorModel.fromMap(map['operator'] as Map<String, dynamic>)
          : null,
      admin: map['admin'] != null
          ? AdminModel.fromMap(map['admin'] as Map<String, dynamic>)
          : null,
      licensor: map['licensor'] != null
          ? LicensorModel.fromMap(map['licensor'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(client: $client, operator: $operator, admin: $admin, licensor: $licensor)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.client == client &&
        other.operator == operator &&
        other.admin == admin &&
        other.licensor == licensor;
  }

  @override
  int get hashCode {
    return client.hashCode ^
        operator.hashCode ^
        admin.hashCode ^
        licensor.hashCode;
  }
}
