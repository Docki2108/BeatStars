// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class AdminModel {
  int id_admin;
  String login;
  String password;
  AdminModel({
    required this.id_admin,
    required this.login,
    required this.password,
  });

  AdminModel copyWith({
    int? id_admin,
    String? login,
    String? password,
  }) {
    return AdminModel(
      id_admin: id_admin ?? this.id_admin,
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_admin': id_admin,
      'login': login,
      'password': password,
    };
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id_admin: map['id_admin'] as int,
      login: map['login'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AdminModel(id_admin: $id_admin, login: $login, password: $password)';

  @override
  bool operator ==(covariant AdminModel other) {
    if (identical(this, other)) return true;

    return other.id_admin == id_admin &&
        login == login &&
        other.password == password;
  }

  @override
  int get hashCode => id_admin.hashCode ^ login.hashCode ^ password.hashCode;
}
