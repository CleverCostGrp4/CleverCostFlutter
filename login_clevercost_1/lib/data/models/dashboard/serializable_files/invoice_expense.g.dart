// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invoice_expense.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceExpense _$InvoiceExpenseFromJson(Map<String, dynamic> json) =>
    InvoiceExpense(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      paidExpense:
          (json['paidExpense'] as List<dynamic>).map((e) => e as int).toList(),
      unpaidExpense: (json['unpaidExpense'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      paidCount:
          (json['paidCount'] as List<dynamic>).map((e) => e as int).toList(),
      unPaidCount:
          (json['unPaidCount'] as List<dynamic>).map((e) => e as int).toList(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$InvoiceExpenseToJson(InvoiceExpense instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'paidExpense': instance.paidExpense,
      'unpaidExpense': instance.unpaidExpense,
      'paidCount': instance.paidCount,
      'unPaidCount': instance.unPaidCount,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
