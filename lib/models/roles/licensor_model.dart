// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class LicensorModel {
  int id_licensor;
  String login;
  String password;
  String mail;
  String info;
  String name;
  String surname;
  String patronymic;
  String passport_series;
  String passport_number;
  LicensorModel({
    required this.id_licensor,
    required this.login,
    required this.password,
    required this.mail,
    required this.info,
    required this.name,
    required this.surname,
    required this.patronymic,
    required this.passport_series,
    required this.passport_number,
  });

  LicensorModel copyWith({
    int? id_licensor,
    String? login,
    String? password,
    String? mail,
    String? info,
    String? name,
    String? surname,
    String? patronymic,
    String? passport_series,
    String? passport_number,
  }) {
    return LicensorModel(
      id_licensor: id_licensor ?? this.id_licensor,
      login: login ?? this.login,
      password: password ?? this.password,
      mail: mail ?? this.mail,
      info: info ?? this.info,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      patronymic: patronymic ?? this.patronymic,
      passport_series: passport_series ?? this.passport_series,
      passport_number: passport_number ?? this.passport_number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_licensor': id_licensor,
      'login': login,
      'password': password,
      'mail': mail,
      'info': info,
      'name': name,
      'surname': surname,
      'patronymic': patronymic,
      'passport_series': passport_series,
      'passport_number': passport_number,
    };
  }

  factory LicensorModel.fromMap(Map<String, dynamic> map) {
    return LicensorModel(
      id_licensor: map['id_licensor'] as int,
      login: map['login'] as String,
      password: map['password'] as String,
      mail: map['mail'] as String,
      info: map['info'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      patronymic: map['patronymic'] as String,
      passport_series: map['passport_series'] as String,
      passport_number: map['passport_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LicensorModel.fromJson(String source) =>
      LicensorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'LicensorModel(id_licensor: $id_licensor, login: $login, password: $password, mail: $mail, info: $info, name: $name, surname: $surname, patronymic: $patronymic, passport_series: $passport_series, passport_number: $passport_number)';
  }

  @override
  bool operator ==(covariant LicensorModel other) {
    if (identical(this, other)) return true;

    return other.id_licensor == id_licensor &&
        login == login &&
        other.password == password &&
        other.mail == mail &&
        other.info == info &&
        other.name == name &&
        other.surname == surname &&
        other.patronymic == patronymic &&
        other.passport_series == passport_series &&
        other.passport_number == passport_number;
  }

  @override
  int get hashCode {
    return id_licensor.hashCode ^
        login.hashCode ^
        password.hashCode ^
        mail.hashCode ^
        info.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        patronymic.hashCode ^
        passport_series.hashCode ^
        passport_number.hashCode;
  }
}
