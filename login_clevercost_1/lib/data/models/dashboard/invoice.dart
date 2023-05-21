import 'package:json_annotation/json_annotation.dart';

import 'expense_data.dart';

part 'serializable_files/invoice.g.dart';

@JsonSerializable()
class Invoice {
  int weekCount;
  int totalCount;
  ExpenseData expenseData;

  Invoice({
    required this.weekCount,
    required this.totalCount,
    required this.expenseData,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
