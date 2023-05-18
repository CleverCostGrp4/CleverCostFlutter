import 'dart:convert';
import 'package:login_clevercost_1/data/models/result.dart';

class LoginResponse {
  int ?status;
  String message;
  Result? result;

  LoginResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        message: json["message"],
        result: json["result"].isEmpty ? null : Result?.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result!.toJson(),
      };
}
