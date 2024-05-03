import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/exceptions.dart';
import 'package:capoeirasport_project/core/network/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_local_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/datasources/news_remote_data_source.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSourceImpl remoteDataSource;
  final NewsLocalDataSourceImpl localDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    @Named.from(NewsRemoteDataSourceImpl) required this.remoteDataSource,
    @Named.from(NewsLocalDataSourceImpl) required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Result<List<News>, Exception>> getNewsList() async {
    if (await networkInfo.isConnected) {
      try {
        final List<News> remoteNewsList = await remoteDataSource.getListOfThings();
        localDataSource.cacheTypeModelList(remoteNewsList as List<NewsModel>);
        return Success(value: remoteNewsList);
      } on ServerException {
        return Failure(
          exception: ServerException(),
        );
      }
    } else {
      try {
        final List<News> localNewsList = await localDataSource.getLastTypeModelList();
        return Success(value: localNewsList);
      } on CacheException {
        return Failure(
          exception: CacheException(),
        );
      }
    }
  }
}
