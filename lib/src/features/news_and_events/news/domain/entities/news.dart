import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'Id')
  final int id;
  @HiveField(1)
  @JsonKey(name: 'Title')
  final String title;
  @HiveField(2)
  @JsonKey(name: 'Date')
  final String date;

  const News({
    required this.id,
    required this.title,
    required this.date,
  });

  @override
  List<Object?> get props => [id, title, date];
}
