// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponse _$DashboardResponseFromJson(Map<String, dynamic> json) =>
    DashboardResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      result: DashboardResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardResponseToJson(DashboardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result,
    };
