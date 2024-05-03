import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_result_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsResultModel extends NewsResult {
  const NewsResultModel({
    required super.status,
    required List<NewsModel> super.data,
  });

  @override
  List<NewsModel> get data => super.data as List<NewsModel>;

  factory NewsResultModel.fromJson(Map<String, dynamic> json) =>
      _$NewsResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsResultModelToJson(this);
}
