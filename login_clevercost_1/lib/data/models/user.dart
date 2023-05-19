import 'dart:convert';
import 'package:login_clevercost_1/data/models/language.dart';
import 'package:login_clevercost_1/data/models/company.dart';

class User {
  int id;
  String name;
  String email;
  bool isAdmin;
  bool status;
  bool isDeactivated;
  Language language;
  List<Company> companies;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.status,
    required this.isDeactivated,
    required this.language,
    required this.companies,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        isAdmin: (json["is_admin"] == 1),
        status: (json["status"] == 1),
        isDeactivated: (json["is_deactivated"] == 1),
        language: Language.fromJson(json["language"]),
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "is_admin": isAdmin ? 1 : 0,
        "status": status ? 1 : 0,
        "is_deactivated": isDeactivated ? 1 : 0,
        "language": language.toJson(),
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
