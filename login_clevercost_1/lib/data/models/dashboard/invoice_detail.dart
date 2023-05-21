import 'package:json_annotation/json_annotation.dart';

part 'serializable_files/invoice_detail.g.dart';

@JsonSerializable()
class InvoiceDetail {
  dynamic grandTotal;
  dynamic totalVat;
  int invoiceCount;
  int vendorCount;

  InvoiceDetail({
    this.grandTotal,
    this.totalVat,
    required this.invoiceCount,
    required this.vendorCount,
  });

  factory InvoiceDetail.fromJson(Map<String, dynamic> json) =>
      _$InvoiceDetailFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceDetailToJson(this);
}
