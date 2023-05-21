// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Charts _$ChartsFromJson(Map<String, dynamic> json) => Charts(
      topVendors: json['topVendors'] as List<dynamic>,
      invoiceExpense: InvoiceExpense.fromJson(
          json['invoiceExpense'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChartsToJson(Charts instance) => <String, dynamic>{
      'topVendors': instance.topVendors,
      'invoiceExpense': instance.invoiceExpense,
    };
