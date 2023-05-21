// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../expense_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseData _$ExpenseDataFromJson(Map<String, dynamic> json) => ExpenseData(
      invoiceDetail:
          InvoiceDetail.fromJson(json['invoiceDetail'] as Map<String, dynamic>),
      paidInvoices: json['paidInvoices'] as int,
      unpaidInvoices: json['unpaidInvoices'] as int,
    );

Map<String, dynamic> _$ExpenseDataToJson(ExpenseData instance) =>
    <String, dynamic>{
      'invoiceDetail': instance.invoiceDetail,
      'paidInvoices': instance.paidInvoices,
      'unpaidInvoices': instance.unpaidInvoices,
    };
