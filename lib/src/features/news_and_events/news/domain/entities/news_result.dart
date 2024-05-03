import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'news_result.g.dart';

@HiveType(typeId: 1)
class NewsResult extends Equatable {
  @HiveField(0)
  final String status;
  @HiveField(1)
  final List<News> data;

  const NewsResult({
    required this.status,
    required this.data,
  });
  
  @override
  List<Object?> get props => [status, data];
}
