import 'package:json_annotation/json_annotation.dart';

import 'dashboard_result.dart';

part 'serializable_files/dashboard_response.g.dart';

@JsonSerializable()
class DashboardResponse {
  int status;
  String message;
  DashboardResult result;

  DashboardResponse({
    required this.status,
    required this.message,
    required this.result,
  });

  factory DashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardResponseFromJson(json);

      Map<String,dynamic> toJson() => _$DashboardResponseToJson(this);
}
