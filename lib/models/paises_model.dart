import 'dart:convert';

class ModelPaises {
  ModelPaises({
    this.data,
  });

  final List<Paises> data;

  factory ModelPaises.fromRawJson(String str) =>
      ModelPaises.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelPaises.fromJson(Map<String, dynamic> json) => ModelPaises(
        data: json["data"] == null
            ? null
            : List<Paises>.from(json["data"].map((x) => Paises.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Paises {
  Paises({
    this.country,
    this.cases,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.updatedAt,
  });

  final String country;
  final int cases;
  final int confirmed;
  final int deaths;
  final int recovered;
  final DateTime updatedAt;

  factory Paises.fromRawJson(String str) => Paises.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Paises.fromJson(Map<String, dynamic> json) => Paises(
        country: json["country"] == null ? null : json["country"],
        cases: json["cases"] == null ? null : json["cases"],
        confirmed: json["confirmed"] == null ? null : json["confirmed"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "country": country == null ? null : country,
        "cases": cases == null ? null : cases,
        "confirmed": confirmed == null ? null : confirmed,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
