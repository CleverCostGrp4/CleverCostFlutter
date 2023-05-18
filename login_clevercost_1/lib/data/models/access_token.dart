import 'dart:convert';

class AccessToken {
  int userId;
  String fcmToken;
  String loginType;
  String pageType;
  String token;
  String userAgent;
  String other;
  String timezone;
  bool status;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  AccessToken({
    required this.userId,
    required this.fcmToken,
    required this.loginType,
    required this.pageType,
    required this.token,
    required this.userAgent,
    required this.other,
    required this.timezone,
    required this.status,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory AccessToken.fromRawJson(String str) =>
      AccessToken.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
        userId: json["user_id"],
        fcmToken: json["fcm_token"],
        loginType: json["login_type"],
        pageType: json["page_type"],
        token: json["token"],
        userAgent: json["user_agent"],
        other: json["other"],
        timezone: json["timezone"],
        status: (json["status"] == 1),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "fcm_token": fcmToken,
        "login_type": loginType,
        "page_type": pageType,
        "token": token,
        "user_agent": userAgent,
        "other": other,
        "timezone": timezone,
        "status": status ? 1 : 0,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
