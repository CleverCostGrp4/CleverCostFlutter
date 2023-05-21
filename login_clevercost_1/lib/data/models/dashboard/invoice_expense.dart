import 'package:json_annotation/json_annotation.dart';

part 'serializable_files/invoice_expense.g.dart';

@JsonSerializable()
class InvoiceExpense {
  List<String> categories;
  List<int> paidExpense;
  List<int> unpaidExpense;
  List<int> paidCount;
  List<int> unPaidCount;
  DateTime startDate;
  DateTime endDate;

  InvoiceExpense({
    required this.categories,
    required this.paidExpense,
    required this.unpaidExpense,
    required this.paidCount,
    required this.unPaidCount,
    required this.startDate,
    required this.endDate,
  });

  factory InvoiceExpense.fromJson(Map<String, dynamic> json) =>
      _$InvoiceExpenseFromJson(json);

  Map<String, dynamic> tojson() => _$InvoiceExpenseToJson(this);
}
