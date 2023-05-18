import 'dart:convert';
import 'package:login_clevercost_1/data/models/currency.dart';

class Company {
  int id;
  String name;
  int cvrNumber;
  String email;
  String phone;
  String clevercostEmail;
  String? industry;
  String address;
  String city;
  int zip;
  bool isSelected;
  bool isDeactivated;
  Currency currency;
  DateTime createdAt;
  DateTime updatedAt;

  Company({
    required this.id,
    required this.name,
    required this.cvrNumber,
    required this.email,
    required this.phone,
    required this.clevercostEmail,
    this.industry,
    required this.address,
    required this.city,
    required this.zip,
    required this.isSelected,
    required this.isDeactivated,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        cvrNumber: json["cvr_number"],
        email: json["email"],
        phone: json["phone"],
        clevercostEmail: json["clevercost_email"],
        industry: json["industry"],
        address: json["address"],
        city: json["city"],
        zip: json["zip"],
        isSelected: (json["is_selected"] == 1),
        isDeactivated: (json["is_deactivated"] == 1),
        currency: Currency.fromJson(json["currency"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cvr_number": cvrNumber,
        "email": email,
        "phone": phone,
        "clevercost_email": clevercostEmail,
        "industry": industry,
        "address": address,
        "city": city,
        "zip": zip,
        "is_selected": isSelected ? 1 : 0,
        "is_deactivated": isDeactivated ? 1 : 0,
        "currency": currency.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
