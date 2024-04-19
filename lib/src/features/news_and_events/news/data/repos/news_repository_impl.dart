import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources.dart';
import 'package:capoeirasport_project/core/common/repository/common_remote_repository.dart';
import 'package:capoeirasport_project/core/common/result.dart';
import 'package:capoeirasport_project/core/network/exceptions/exception.dart';
import 'package:capoeirasport_project/core/network/exceptions/error.dart';
import 'package:capoeirasport_project/core/network/network_info.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/entities/news.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/domain/repos/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final CommonRemoteRepository<NewsModel> remoteDataSource;
  final CommonLocalDataSource<News> localDataSource;
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
        final List<News> remoteNewsList = await remoteDataSource.getListOfThings();
        localDataSource.cacheTypeModelList(remoteNewsList as List<NewsModel>);
        return Success(value: remoteNewsList);
      } on ServerException {
        return Failure(
          failure: ServerError(),
        );
      }
    } else {
      try {
        final List<News> localNewsList = await localDataSource.getLastTypeModelList();
        return Success(value: localNewsList);
      } on CacheException {
        return Failure(
          failure: CacheError(),
        );
      }
    }
  }
}
