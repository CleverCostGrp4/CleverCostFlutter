import 'dart:convert';

class Language {
  int id;
  String name;
  String code;
  String? direction;
  int sortOrder;

  Language({
    required this.id,
    required this.name,
    required this.code,
    this.direction,
    required this.sortOrder,
  });

  factory Language.fromRawJson(String str) =>
      Language.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        direction: json["direction"],
        sortOrder: json["sort_order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "direction": direction,
        "sort_order": sortOrder,
      };
}
