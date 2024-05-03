// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResultModel _$EventResultModelFromJson(Map<String, dynamic> json) =>
    EventResultModel(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => EventModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventResultModelToJson(EventResultModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
