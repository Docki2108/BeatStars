// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class OperatorModel {
  int id_operator;
  String login;
  String password;
  OperatorModel({
    required this.id_operator,
    required this.login,
    required this.password,
  });

  OperatorModel copyWith({
    int? id_operator,
    String? login,
    String? password,
  }) {
    return OperatorModel(
      id_operator: id_operator ?? this.id_operator,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_operator': id_operator,
      'login': login,
      'password': password,
    };
  }

  factory OperatorModel.fromMap(Map<String, dynamic> map) {
    return OperatorModel(
      id_operator: map['id_operator'] as int,
      login: map['login'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OperatorModel.fromJson(String source) =>
      OperatorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OperatorModel(id_operator: $id_operator, login: $login, password: $password)';

  @override
  bool operator ==(covariant OperatorModel other) {
    if (identical(this, other)) return true;

    return other.id_operator == id_operator &&
        login == login &&
        other.password == password;
  }

  @override
  int get hashCode => id_operator.hashCode ^ login.hashCode ^ password.hashCode;
}
