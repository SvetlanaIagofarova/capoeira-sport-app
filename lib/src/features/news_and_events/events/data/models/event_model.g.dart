// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['Id'] as int,
      title: json['Title'] as String,
      imgUrl: json['imgUrl'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'imgUrl': instance.imgUrl,
      'url': instance.url,
    };
