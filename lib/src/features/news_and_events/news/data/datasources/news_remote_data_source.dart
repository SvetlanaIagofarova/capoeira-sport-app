import 'package:capoeirasport_project/core/common/repository/common_remote_repository.dart';
import 'package:capoeirasport_project/src/consts/api_path_consts.dart';
import 'package:capoeirasport_project/src/features/news_and_events/news/data/models/news_model.dart';
import 'package:injectable/injectable.dart';


@named
@Singleton(as: CommonRemoteRepository)
class NewsRemoteDataSourceImpl extends CommonRemoteRepository<NewsModel> {
  NewsRemoteDataSourceImpl({required super.client});

  @override
  NewsModel fromJson(Map<String, dynamic> json) => NewsModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(NewsModel body) => body.toJson();

  @override
  String get path => ApiPathsConsts.newsListPath;
}
