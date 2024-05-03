// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResultModel _$NewsResultModelFromJson(Map<String, dynamic> json) =>
    NewsResultModel(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsResultModelToJson(NewsResultModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
