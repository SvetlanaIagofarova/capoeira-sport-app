import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsModel extends News {
  const NewsModel({
    required super.id,
    required super.title,
    required super.date,
    required super.url,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
