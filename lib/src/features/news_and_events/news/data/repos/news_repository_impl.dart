import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/exceptions/exception.dart';
import 'package:capoeirasport_project/core/exceptions/error.dart';
import 'package:capoeirasport_project/core/utils/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_local_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_remote_data_sources.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Result<List<News>, Error>> getNewsList() async {
    if (await networkInfo.isConnected) {
      try {
        final List<News> remoteNewsList = await remoteDataSource.getNewsList();
        localDataSource.cacheNewsList(remoteNewsList as List<NewsModel>);
        return Success(value: remoteNewsList);
      } on ServerException {
        return Failure(
          failure: ServerError(),
        );
      }
    } else {
      try {
        final List<News> localNewsList = await localDataSource.getLastNewsList();
        return Success(value: localNewsList);
      } on CacheException {
        return Failure(
          failure: CacheError(),
        );
      }
    }
  }
}
