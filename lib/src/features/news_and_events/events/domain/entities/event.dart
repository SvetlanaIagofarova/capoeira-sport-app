import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends Equatable {
  @HiveField(0)
  @JsonKey(name: 'Id')
  final int id;
  @HiveField(1)
  @JsonKey(name: 'Title')
  final String title;
  @HiveField(2)
  final String imgUrl;
  @HiveField(3)
  final String url;

  const Event({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.url,
  });

  @override
  List<Object?> get props => [id, title, imgUrl, url];
}
