// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ClientModel {
  int id_client;
  String login;
  String password;
  String mail;
  String telephone;
  String name;
  String surname;
  String patronymic;
  String passport_series;
  String passport_number;
  ClientModel({
    required this.id_client,
    required this.login,
    required this.password,
    required this.mail,
    required this.telephone,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.passport_series,
    required this.passport_number,
  });

  ClientModel copyWith({
    int? id_client,
    String? login,
    String? password,
    String? mail,
    String? telephone,
    String? name,
    String? surname,
    String? patronymic,
    String? passport_series,
    String? passport_number,
  }) {
    return ClientModel(
      id_client: id_client ?? this.id_client,
      login: login ?? this.login,
      password: password ?? this.password,
      mail: mail ?? this.mail,
      telephone: telephone ?? this.telephone,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      patronymic: patronymic ?? this.patronymic,
      passport_series: passport_series ?? this.passport_series,
      passport_number: passport_number ?? this.passport_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_client': id_client,
      'login': login,
      'password': password,
      'mail': mail,
      'telephone': telephone,
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'passport_series': passport_series,
      'passport_number': passport_number,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id_client: map['id_client'] as int,
      login: map['login'] as String,
      password: map['password'] as String,
      mail: map['mail'] as String,
      telephone: map['telephone'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      patronymic: map['patronymic'] as String,
      passport_series: map['passport_series'] as String,
      passport_number: map['passport_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClientModel(id_client: $id_client, login: $login, password: $password, mail: $mail, telephone: $telephone, name: $name, surname: $surname, patronymic: $patronymic, passport_series: $passport_series, passport_number: $passport_number)';
  }

  @override
  bool operator ==(covariant ClientModel other) {
    if (identical(this, other)) return true;

    return other.id_client == id_client &&
        other.login == login &&
        other.password == password &&
        other.mail == mail &&
        other.telephone == telephone &&
        other.name == name &&
        other.surname == surname &&
        other.patronymic == patronymic &&
        other.passport_series == passport_series &&
        other.passport_number == passport_number;
  }

  @override
  int get hashCode {
    return id_client.hashCode ^
        login.hashCode ^
        password.hashCode ^
        mail.hashCode ^
        telephone.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        patronymic.hashCode ^
        passport_series.hashCode ^
        passport_number.hashCode;
  }
}
