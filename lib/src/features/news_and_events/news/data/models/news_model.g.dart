// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      id: (json['Id'] as num).toInt(),
      title: json['Title'] as String,
      date: json['Date'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Date': instance.date,
      'url': instance.url,
    };
