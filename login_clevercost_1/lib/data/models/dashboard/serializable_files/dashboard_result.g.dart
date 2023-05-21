// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dashboard_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResult _$DashboardResultFromJson(Map<String, dynamic> json) =>
    DashboardResult(
      vendor: Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
      invoice: Invoice.fromJson(json['invoice'] as Map<String, dynamic>),
      charts: Charts.fromJson(json['charts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResultToJson(DashboardResult instance) =>
    <String, dynamic>{
      'vendor': instance.vendor,
      'invoice': instance.invoice,
      'charts': instance.charts,
    };
