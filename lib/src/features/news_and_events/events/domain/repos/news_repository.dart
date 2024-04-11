
import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/src/features/news_and_events/events/domain/entities/news.dart';

abstract interface class NewsRepository {
  Future<Result<List<News>, Exception>> getNewsList();
}