import 'dart:convert';

class PactModel {
  int id;
  DateTime pact_date;
  DateTime expiration_date;
  PactModel({
    required this.id,
    required this.pact_date,
    required this.expiration_date,
  });

  PactModel copyWith({
    int? id,
    DateTime? pact_date,
    DateTime? expiration_date,
  }) {
    return PactModel(
      id: id ?? this.id,
      pact_date: pact_date ?? this.pact_date,
      expiration_date: expiration_date ?? this.expiration_date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pact_date': pact_date.millisecondsSinceEpoch,
      'expiration_date': expiration_date.millisecondsSinceEpoch,
    };
  }

  factory PactModel.fromMap(Map<String, dynamic> map) {
    return PactModel(
      id: map['id'] as int,
      pact_date: DateTime.fromMillisecondsSinceEpoch(map['pact_date'] as int),
      expiration_date:
          DateTime.fromMillisecondsSinceEpoch(map['expiration_date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PactModel.fromJson(String source) =>
      PactModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'PactModel(id: $id, pact_date: $pact_date, expiration_date: $expiration_date)';

  @override
  bool operator ==(covariant PactModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.pact_date == pact_date &&
        other.expiration_date == expiration_date;
  }

  @override
  int get hashCode =>
      id.hashCode ^ pact_date.hashCode ^ expiration_date.hashCode;
}
