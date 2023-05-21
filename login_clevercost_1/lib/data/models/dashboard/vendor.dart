import 'package:json_annotation/json_annotation.dart';

part 'serializable_files/vendor.g.dart';

@JsonSerializable()
class Vendor {
  int weekCount;
  int totalCount;

  Vendor({
    required this.weekCount,
    required this.totalCount,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
  Map<String, dynamic> toJson() => _$VendorToJson(this);
}
