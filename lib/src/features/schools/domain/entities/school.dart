import 'package:capoeirasport_project/src/features/schools/domain/entities/gradation.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'school.g.dart';

@HiveType(typeId: 2)
class School extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'Id')
  final int id;
  @HiveField(1)
  @JsonKey(name: 'Name')
  final String name;
  @HiveField(2)
  @JsonKey(name: 'Gradation')
  final Map<String, Gradation> gradation;

  const School({
    required this.id,
    required this.name,
    required this.gradation,
  });

  @override
  List<Object?> get props => [id, name, gradation];
}

/*
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
*/