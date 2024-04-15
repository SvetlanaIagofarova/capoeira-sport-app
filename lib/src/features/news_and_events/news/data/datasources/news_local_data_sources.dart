import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';

abstract class NewsLocalDataSource {
  /// Gets the cached [NewsModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<NewsModel>> getLastNewsList();

  Future<void> cacheNewsList(List<NewsModel> newsListToCache);
}