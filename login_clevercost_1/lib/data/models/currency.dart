import 'dart:convert';

class Currency {
  int id;
  String country;
  String name;
  String langCode;
  String symbol;
  dynamic direction;

  Currency({
    required this.id,
    required this.country,
    required this.name,
    required this.langCode,
    required this.symbol,
    this.direction,
  });

  factory Currency.fromRawJson(String str) =>
      Currency.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        id: json["id"],
        country: json["country"],
        name: json["name"],
        langCode: json["lang_code"],
        symbol: json["symbol"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "name": name,
        "lang_code": langCode,
        "symbol": symbol,
        "direction": direction,
      };
}
