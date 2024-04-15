import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  /// Calls the https://capoeirasport.com/getMobileNews endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<NewsModel>> getNewsList();
}