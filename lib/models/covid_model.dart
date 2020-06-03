import 'dart:convert';

class ModelCovid {
  ModelCovid({
    this.data,
  });

  final List<Covid> data;

  factory ModelCovid.fromRawJson(String str) =>
      ModelCovid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ModelCovid.fromJson(Map<String, dynamic> json) => ModelCovid(
        data: json["data"] == null
            ? null
            : List<Covid>.from(json["data"].map((x) => Covid.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Covid {
  Covid({
    this.uid,
    this.uf,
    this.state,
    this.cases,
    this.deaths,
    this.suspects,
    this.refuses,
    this.broadcast,
    this.comments,
    this.datetime,
  });

  final int uid;
  final String uf;
  final String state;
  final int cases;
  final int deaths;
  final int suspects;
  final int refuses;
  final bool broadcast;
  final String comments;
  final DateTime datetime;

  factory Covid.fromRawJson(String str) => Covid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Covid.fromJson(Map<String, dynamic> json) => Covid(
        uid: json["uid"] == null ? null : json["uid"],
        uf: json["uf"] == null ? null : json["uf"],
        state: json["state"] == null ? null : json["state"],
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        suspects: json["suspects"] == null ? null : json["suspects"],
        refuses: json["refuses"] == null ? null : json["refuses"],
        broadcast: json["broadcast"] == null ? null : json["broadcast"],
        comments: json["comments"] == null ? null : json["comments"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "uf": uf == null ? null : uf,
        "state": state == null ? null : state,
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "suspects": suspects == null ? null : suspects,
        "refuses": refuses == null ? null : refuses,
        "broadcast": broadcast == null ? null : broadcast,
        "comments": comments == null ? null : comments,
        "datetime": datetime == null ? null : datetime.toIso8601String(),
      };
}
