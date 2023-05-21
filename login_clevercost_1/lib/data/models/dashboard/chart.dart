import 'package:json_annotation/json_annotation.dart';

import 'invoice_expense.dart';

part 'serializable_files/chart.g.dart';

@JsonSerializable()
class Charts {
  List<dynamic> topVendors;
  InvoiceExpense invoiceExpense;

  Charts({
    required this.topVendors,
    required this.invoiceExpense,
  });

  factory Charts.fromJson(Map<String, dynamic> json) => _$ChartsFromJson(json);

  Map<String, dynamic> toJson() => _$ChartsToJson(this);
}
