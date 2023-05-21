// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      weekCount: json['weekCount'] as int,
      totalCount: json['totalCount'] as int,
      expenseData:
          ExpenseData.fromJson(json['expenseData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'weekCount': instance.weekCount,
      'totalCount': instance.totalCount,
      'expenseData': instance.expenseData,
    };
