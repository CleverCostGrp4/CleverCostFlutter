import 'package:json_annotation/json_annotation.dart';

import 'chart.dart';
import 'invoice.dart';
import 'vendor.dart';

part 'serializable_files/dashboard_result.g.dart';

@JsonSerializable()
class DashboardResult {
  Vendor vendor;
  Invoice invoice;
  Charts charts;

  DashboardResult({
    required this.vendor,
    required this.invoice,
    required this.charts,
  });

  factory DashboardResult.fromJson(Map<String, dynamic> json) =>
      _$DashboardResultFromJson(json);

  Map<String,dynamic> toJson() => _$DashboardResultToJson(this);
}
