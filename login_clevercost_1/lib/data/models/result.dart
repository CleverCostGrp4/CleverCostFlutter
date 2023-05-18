import 'dart:convert';
import 'package:login_clevercost_1/data/models/user.dart';
import 'package:login_clevercost_1/data/models/access_token.dart';

class Result {
  User user;
  AccessToken accessToken;

  Result({
    required this.user,
    required this.accessToken,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        user: User.fromJson(json["user"]),
        accessToken: AccessToken.fromJson(json["accessToken"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "accessToken": accessToken.toJson(),
      };
}
