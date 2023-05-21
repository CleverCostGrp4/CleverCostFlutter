// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../invoice_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDetail _$InvoiceDetailFromJson(Map<String, dynamic> json) =>
    InvoiceDetail(
      grandTotal: json['grandTotal'],
      totalVat: json['totalVat'],
      invoiceCount: json['invoiceCount'] as int,
      vendorCount: json['vendorCount'] as int,
    );

Map<String, dynamic> _$InvoiceDetailToJson(InvoiceDetail instance) =>
    <String, dynamic>{
      'grandTotal': instance.grandTotal,
      'totalVat': instance.totalVat,
      'invoiceCount': instance.invoiceCount,
      'vendorCount': instance.vendorCount,
    };
