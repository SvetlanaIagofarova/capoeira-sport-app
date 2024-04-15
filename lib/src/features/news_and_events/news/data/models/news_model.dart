import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';

class NewsModel extends News {
  const NewsModel({
    required super.id,
    required super.title,
    required super.date,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['Id'],
      title: json['Title'],
      date: json['Date'],
    );
  }
}
