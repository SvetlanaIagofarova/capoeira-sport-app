import 'package:capoeirasport_project/core/common/datasources/common_local_data_sources.dart';
import 'package:capoeirasport_project/core/exceptions/exception.dart';
import 'package:capoeirasport_project/core/utils/hive_service.dart';



class NewsLocalDataSourceImpl<NewsModel> implements CommonLocalDataSource<NewsModel> {
  final HiveService _hiveService;

  NewsLocalDataSourceImpl({
    required HiveService hiveService,
  }) : _hiveService = hiveService;

  @override
  BoxType get boxType => BoxType.newsList;

  @override
  Future<void> cacheTypeModelList(List<NewsModel> newsListToCache) {
    throw UnimplementedError();
  }

  @override
  Future<List<NewsModel>> getLastTypeModelList() {
    final List<NewsModel>? lastNewsList =
        _hiveService.getAllThings(boxType: boxType);

    if (lastNewsList != null) {
      return Future.value(lastNewsList);
    } else {
      throw CacheException();
    }
  }
}
