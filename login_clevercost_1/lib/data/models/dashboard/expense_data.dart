import 'package:json_annotation/json_annotation.dart';

import 'invoice_detail.dart';

part 'serializable_files/expense_data.g.dart';

@JsonSerializable()
class ExpenseData {
  InvoiceDetail invoiceDetail;
  int paidInvoices;
  int unpaidInvoices;

  ExpenseData({
    required this.invoiceDetail,
    required this.paidInvoices,
    required this.unpaidInvoices,
  });

  factory ExpenseData.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDataToJson(this);
}
